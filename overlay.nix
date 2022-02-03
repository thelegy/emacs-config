final: prev: {

  emacsPackagesFor = emacs: (prev.emacsPackagesFor emacs).overrideScope' (
    efinal: eprev: eprev // {

      config-thelegy = efinal.callPackage ./config {};

    }
  );

  emacsGcc-nox = final.emacsGit-nox.override { nativeComp = true; };

  emacs-thelegy = (final.emacsPackagesFor final.emacsPgtkGcc).withPackages (p: [ p.config-thelegy ]);
  emacs-thelegy-nox = (final.emacsPackagesFor final.emacsGcc-nox).withPackages (p: [ p.config-thelegy ]);

}
