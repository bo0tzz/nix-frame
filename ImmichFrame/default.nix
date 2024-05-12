let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    pkgs = import nixpkgs { config = {}; overlays = []; };
in
{
    ImmichFrame = pkgs.callPackage ./ImmichFrame.nix { };
}