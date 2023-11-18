{
  description = "dad's flake template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/haskell-updates";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hpkgs = pkgs.haskellPackages.override (old: {
          overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: { }))
            (self: super: {
              haskell-flake = self.callCabal2nix "haskell-flake" ./. { };
            });
        });
      in
      {
        packages = { inherit (hpkgs) haskell-flake; };
        defaultPackage = self.packages.${system}.haskell-flake;
        devShell = hpkgs.shellFor {
          packages = h: [ h.haskell-flake ];
          buildInputs = with hpkgs; [
            cabal-install
            dhall
            dhall-lsp-server
            ghcid
            haskell-language-server
            nixfmt
            ormolu
          ];
          withHoogle = false;
          withHaddocks = false;
        };
      });
}
