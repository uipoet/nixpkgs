{ fetchFromGitHub, gtk-engine-murrine, lib, stdenv }:

stdenv.mkDerivation rec {
  dontBuild = true;

  installPhase = ''
    install -dm 755 $out/share/icons/Aiki
    install -dm 755 $out/share/themes/Aiki
    cp -dr --no-preserve='ownership' icons/* $out/share/icons/Aiki/
    cp -dr --no-preserve='ownership' {index.theme,assets,gtk-2.0,gtk-3.0,gtk-3.20} $out/share/themes/Aiki/
  '';

  pname = "aiki-gtk-theme";

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  meta = with lib; {
    description = "Aiki Gtk Theme";
    platforms = platforms.unix;
  };

  src = fetchFromGitHub {
    owner = "uipoet";
    repo = "aiki-gtk-theme";
    rev = "1b20b93a26cbddb97415531d5b93c2f4240d8162";
    sha256 = "03sxwf2215mw9lk2k6vgycx1m564w8cmzldpm9066xfdx8c5ylai";
  };

  version = "1.0.0";
}
