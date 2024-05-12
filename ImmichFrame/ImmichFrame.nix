{ lib, stdenv, fetchurl, makeWrapper, autoPatchelfHook, libz, gcc-unwrapped }:

stdenv.mkDerivation rec {
  pname = "ImmichFrame";
  version = "1.0.1.0";

  dontStrip = true;

  src = fetchurl {
    url = "https://github.com/3rob3/ImmichFrame/releases/download/v${version}/ImmichFrame-v${version}-linux-x64.tar.gz";
    hash = "sha256-2ZtUbKVkQdXNQAWk1kSf1+rYOUwzBXKQh9qrQ33zM0A=";
  };

  buildInputs = [
    libz
    gcc-unwrapped
  ];

  nativeBuildInputs = [ 
    makeWrapper
    autoPatchelfHook
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp -r * $out/bin/
    wrapProgram $out/bin/Immich_Frame --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1

    runHook postInstall
  '';
}