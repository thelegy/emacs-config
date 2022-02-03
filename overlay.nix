final: prev: {

  emacsPgtk = (final.emacs.override {
    withPgtk = false;
  }).overrideAttrs (old: {
    configureFlags = final.lib.remove "--with-xft" old.configureFlags;
  });

  emacsPackagesFor = emacs: (prev.emacsPackagesFor emacs).overrideScope' (
    efinal: eprev: eprev // {

      config-thelegy = efinal.callPackage ./config {};

    }
  );

  emacs-thelegy = (final.emacsPackagesFor final.emacsPgtk).withPackages (p: [ p.config-thelegy ]);
  emacs-thelegy-nox = (final.emacsPackagesFor final.emacs-nox).withPackages (p: [ p.config-thelegy ]);

}
