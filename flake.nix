{

  inputs.wat.url = github:thelegy/wat;
  inputs.emacs-overlay.url = github:nix-community/emacs-overlay;

  outputs = { wat, emacs-overlay, ... }: wat.lib.eachDefaultSystem (system: pkgs: rec {
    systemOverlays = [ emacs-overlay.overlay overlay ];

    packages.emacs-thelegy = pkgs.emacs-thelegy;
    packages.emacs-thelegy-nox = pkgs.emacs-thelegy-nox;

    defaultPackage = pkgs.emacs-thelegy;

    overlay = import ./overlay.nix;

  });

}
