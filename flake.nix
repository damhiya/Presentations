{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            gnumake
            texlive.combined.scheme-full
            python3Packages.pygments
          ];
        };
      in { devShell = shell; });
}
