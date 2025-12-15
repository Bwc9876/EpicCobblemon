{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };
  outputs = { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
			package = pkgs: pkgs.writeShellApplication {
				name = "epic-cobblemon-serve";

				runtimeInputs = [pkgs.packwiz];

				text = ''
					cd ${./.}
					packwiz serve "$@"
				'';
			};
      devShell.packages = pkgs: with pkgs; [ packwiz ];
    };
}
