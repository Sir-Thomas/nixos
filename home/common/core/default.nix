{ config, inputs, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  home.username = "tommy";
  home.homeDirectory = "/home/tommy";
  home.stateVersion = "25.11";
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos/";
        nrb = "sudo nixos-rebuild boot --flake ~/nixos/";
        gc = "sudo nix-collect-garbage -d";
        cb = "sudo /run/current-system/bin/switch-to-configuration boot";
        tofi-fix = "rm ~/.cache/tofi-drun";
	vi = "nvim";
	vim = "nvim";
      };
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      settings = {
        user.name = "Sir-Thomas";
        user.email = "tp8153@gmail.com";
        init.defaultBranch = "main";
      };
    };
    
    nixvim = {
      enable = true;

      colorschemes.gruvbox.enable = true;

      plugins = {
        bufferline.enable = true;
        lualine.enable = true;
	luasnip.enable = true;
	telescope.enable = true;
	oil.enable = true;
	web-devicons.enable = true;
      };

      plugins.lsp = {
        enable = true;
	servers = {
	  ts_ls.enable = true;
	  lua_ls.enable = true;
	  rust_analyzer = {
	    enable = true;
	    installCargo = false;
	    installRustc = false;
	  };
	};
      };
    };
  };
}
