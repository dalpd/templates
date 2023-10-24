{
  description = "A simple Go package";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = builtins.substring 0 1 "19700101";
      in
      {
        defaultPackage = pkgs.buildGoModule {
          pname = "go-hello";
          src = ./.;
          vendorSha256 = null;
          inherit version;
        };
        devShell = with pkgs; mkShell { buildInputs = [ go gopls gotools go-tools ]; };
        formatter = pkgs.nixpkgs-fmt;
      });
}
