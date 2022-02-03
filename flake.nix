{

  inputs.wat.url = github:thelegy/wat;

  outputs = { wat, ... }: wat.lib.eachDefaultSystem (system: pkgs: rec {
    systemOverlays = [ overlay ];

    packages.emacs-thelegy = pkgs.emacs-thelegy;
    packages.emacs-thelegy-nox = pkgs.emacs-thelegy-nox;

    defaultPackage = pkgs.emacs-thelegy;

    overlay = import ./overlay.nix;

  });

}
