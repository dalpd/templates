{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {

      simpleContainer = {
        path = ./simple-container;
        description = "A NixOS container running apache-httpd";
      };

      python = {
        path = ./python;
        description = "Python template, using poetry2nix";
      };

      rust = {
        path = ./rust;
        description = "Rust template, using Naersk";
      };

      bash-hello = {
        path = ./bash-hello;
        description = "An over-engineered Hello World in bash";
      };

      c-hello = {
        path = ./c-hello;
        description = "An over-engineered Hello World in C";
      };

      rust-web-server = {
        path = ./rust-web-server;
        description = "A Rust web server including a NixOS module";
      };

      compat = {
        path = ./compat;
        description = "A default.nix and shell.nix for backward compatibility with Nix installations that don't support flakes";
      };

      haskell = {
        path = ./haskell;
        description = "A Haskell flake project";
      };

      full = {
        path = ./full;
        description = "A template that shows all standard flake outputs";
        welcomeText = ''
          You just created a template that will show you all standard flake outputs.

          Read more about it here:

            https://github.com/NixOS/templates/tree/master/full
        '';
      };

      pandoc-xelatex = {
        path = ./pandoc-xelatex;
        description = "A report built with Pandoc, XeLaTex and a custom font";
      };

      go-hello = {
        path = ./go-hello;
        description = "A simple Go package";
      };
    };

    defaultTemplate = self.templates.trivial;

  };
}
