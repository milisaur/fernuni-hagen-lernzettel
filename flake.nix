{
  description = "FernUni Hagen Lernzettel";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    r = pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        knitr
        rmarkdown

        tidyverse
        gmodels
        ggplot2
        psych
        Rmisc
        boot
        effectsize
        pwr
        lm_beta
      ];
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        quarto
        r
      ];
      shellHook = ''
        export PATH="${r}/bin:$PATH"
        export QUARTO_R="${r}/bin/R"
      '';
    };
  };
}
