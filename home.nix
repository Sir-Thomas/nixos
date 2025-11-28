{ config, pkgs, ... }:

{
	home.username = "tommy";
	home.homeDirectory = "/home/tommy";
	home.stateVersion = "24.05";
	programs.git = {
		enable = true;
		userName = "Sir-Thomas";
		userEmail = "tp8153@gmail.com";
		extraConfig.init.defaultBranch = "main";
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/nixos/";
			wifi = "nmcli device wifi connect ATTfiMg4I2 --ask";
		};
		bashrcExtra = ''
			if [[ -z "$ZELLIJ" ]]; then
    				if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        				zellij attach -c
    				else
        				zellij
    				fi

    				if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        				exit
    				fi
			fi
		'';
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec uwsm start -S hyprland-uwsm.desktop
			fi
		'';
	};
	home.file.".config/hypr".source = ./hypr;
	home.file.".config/waybar".source = ./waybar;
	home.file.".config/foot".source = ./foot;
}
