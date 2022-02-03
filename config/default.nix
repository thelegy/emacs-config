{ lib
, trivialBuild
, helm
}:

trivialBuild rec {

  pname = "config-thelegy";

  src = ./.;

  packageRequires = [ helm ];

  meta.maintainers = with lib.maintainers; [ thelegy ];

}
