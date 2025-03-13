{ ... }:
{
  boot.kernel.sysctl = {
    "dev.tty.ldisc_autoload" = "0";
    "fs.protected_fifos" = "2";
    "fs.protected_hardlinks" = "1";
    "fs.protected_regular" = "2";
    "fs.protected_symlinks" = "1";
    "kernel.dmesg_restrict" = "1";
    "kernel.kexec_load_disabled" = "1";
    "kernel.kptr_restrict" = "2";
    "kernel.perf_event_paranoid" = "-1";
    "kernel.printk" = "3 3 3 3";
    "kernel.sysrq" = "4";
    "kernel.yama.ptrace_scope" = "0";
    "net.core.bpf_jit_harden" = "2";
    "net.ipv4.conf.all.accept_redirects" = "0";
    "net.ipv4.conf.all.accept_source_route" = "0";
    "net.ipv4.conf.all.rp_filter" = "1";
    "net.ipv4.conf.all.secure_redirects" = "0";
    "net.ipv4.conf.all.send_redirects" = "0";
    "net.ipv4.conf.default.accept_redirects" = "0";
    "net.ipv4.conf.default.accept_source_route" = "0";
    "net.ipv4.conf.default.rp_filter" = "1";
    "net.ipv4.conf.default.secure_redirects" = "0";
    "net.ipv4.conf.default.send_redirects" = "0";
    "net.ipv4.icmp_echo_ignore_all" = "1";
    "net.ipv4.tcp_dsack" = "0";
    "net.ipv4.tcp_fack" = "0";
    "net.ipv4.tcp_rfc1337" = "1";
    "net.ipv4.tcp_sack" = "0";
    "net.ipv4.tcp_syncookies" = "1";
    "net.ipv4.tcp_timestamps" = "1";
    "net.ipv6.conf.all.accept_ra" = "0";
    "net.ipv6.conf.all.accept_redirects" = "0";
    "net.ipv6.conf.all.accept_source_route" = "0";
    "net.ipv6.conf.all.use_tempaddr" = "2";
    "net.ipv6.conf.default.accept_ra" = "0";
    "net.ipv6.conf.default.accept_redirects" = "0";
    "net.ipv6.conf.default.accept_source_route" = "0";
    "vm.mmap_rnd_bits" = "32";
    "vm.mmap_rnd_compat_bits" = "16";
    "vm.unprivileged_userfaultfd" = "0";
  };
}
