{
  description = "vraytekdigor";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      default = import ./default.nix {
        nixpkgs_src = nixpkgs;
        system = system;
        flakeGitHash = self.sourceInfo.shortRev;
      };
    in
  {
    packages.${system}.cfw = default.cfw;
  };
}