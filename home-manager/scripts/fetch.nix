{ pkgs, ...}: let
  fetch = pkgs.writeShellScriptBin "fetch" ''
   #!/bin/sh
#
# ufetch-nixos - tiny system info for nixos

## INFO

# user is already defined
host="$(hostname)"
os="$(nixos-version)"
kernel="$(uname -sr)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
shell="$(basename "${SHELL}")"

for profile in $NIX_PROFILES; do
	if [ -d "$profile" ]; then
		packages="$((packages + $( (nix-store -q --requisites "$profile" 2>/dev/null || printf '') | wc -l)))"
	fi
done

## UI DETECTION

parse_rcs() {
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}

rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

ui='unknown'
uitype='UI'
if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -n "${rcwm}" ]; then
	ui="${rcwm}"
	uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
	ui="${XDG_SESSION_TYPE}"
fi

ui="$(basename "${ui}")"

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold 2> /dev/null)"
	black="$(tput setaf 0 2> /dev/null)"
	red="$(tput setaf 1 2> /dev/null)"
	green="$(tput setaf 2 2> /dev/null)"
	yellow="$(tput setaf 3 2> /dev/null)"
	blue="$(tput setaf 4 2> /dev/null)"
	magenta="$(tput setaf 5 2> /dev/null)"
	cyan="$(tput setaf 6 2> /dev/null)"
	white="$(tput setaf 7 2> /dev/null)"
	reset="$(tput sgr0 2> /dev/null)"
fi

# you can change these
lc="${reset}${bold}${blue}"         # labels
nc="${reset}${bold}${blue}"         # user and hostname
ic="${reset}"                       # info
c0="${reset}${blue}"                # first color
c1="${reset}${bold}${blue}"         # second color

## OUTPUT

sed 's/\\/\\\\/g' <<EOF

${c0}    \\   ${c1}\\ //    ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}   ==\\___${c1}\\/ ${c0}//  ${lc}OS:        ${ic}${os}${reset}
${c1}     //    \\${c0}//   ${lc}KERNEL:    ${ic}${kernel}${reset}
${c1}  ==//      ${c0}//==  ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}   //${c0}\\${c1}____${c0}//     ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1}  // ${c0}/\\   ${c1}\\==   ${lc}SHELL:     ${ic}${shell}${reset}
${c0}    // \\   ${c1}\\    ${lc}${uitype}:        ${ic}${ui}${reset}

EOF
  '';
in {
  home.packages = [fetch];
}
