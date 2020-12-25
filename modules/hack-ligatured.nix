{ fetchzip, lib }:
let
  version = "3.003+Nv2.1.0+FC3.1+JBMv2.001";
  name = "hack-ligatured-${version}";
in
fetchzip {
  meta = with lib; {
    description = "Hack Ligatured";
    license = licenses.free;
    platforms = platforms.all;
  };

  name = name;

  postFetch = ''
    install -dm 755 $out/share/fonts/${name}
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/${name}
  '';

  sha256 = "0n5mwvkd9yx4j3ps01axq1vbyq6dgcrpvas0vr83xhkgcyqw7i4g";

  url = "https://github.com/gaplo917/Ligatured-Hack/releases/download/v${version}/HackLigatured-v${version}.zip";
}
