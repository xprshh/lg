{ makeDesktopItem, copyDesktopItems, fetchFromGitHub, makeWrapper
, python3Packages, qt6, ffmpeg }:
python3Packages.buildPythonApplication rec {
  pname = "onthespot";
  version = "0.7.2";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "justin025";
    repo = "onthespot";
    rev = "refs/tags/v${version}";
    hash = "sha256-93eJs3vECxbfe3InB/tjx0c5+YvFgzRNdFSZR9/UVKc=";
  };

  pythonRelaxDeps = true;

  nativeBuildInputs = [ makeWrapper copyDesktopItems qt6.wrapQtAppsHook ];

  propagatedBuildInputs = with python3Packages; [
    qt6.qtbase
    ffmpeg
    mutagen
    googletrans
    librespot
    pillow
    pyperclip
    pyqt6
    pyqt6-sip
    requests
    setuptools
    urllib3
    wheel
  ];

  postInstall = ''
    wrapProgram $out/bin/onthespot \
      --set PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION "python"
    install -Dm444 $src/src/onthespot/resources/icons/onthespot.png $out/share/icons/hicolor/256x256/apps/onthespot.png
  '';

  /* preFixup = ''
       makeWrapperArgs+=("''${qtWrapperArgs[@]}")
     '';
  */

  desktopItems = [
    (makeDesktopItem {
      name = "Onthespot";
      exec = "onthespot";
      icon = "onthespot";
      desktopName = "Onthespot";
      comment = " QT based Spotify music downloader written in Python";
      categories = [ "Audio" ];
    })
  ];
}
