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

      globals.mapleader = " ";
      globals.maplocalleader = " ";

      opts = {
        scrolloff = 8; # Keeps 8 lines visible above/below the cursor
        sidescrolloff = 8; # Keeps 8 columns visible to the left/right of the cursor
      };

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

      keymaps = [
        {
          mode = "n";
          key = "<leader>e";
          action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          options.desc = "Open diagnostic float";
        }
        {
          mode = "n";
          key = "gd";
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          options.desc = "Go to definition";
        }
        {
          mode = "n";
          key = "K";
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          options.desc = "Show documentation";
        }
	{
          mode = "n";
          key = "<leader>d";
          action = "<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>";
          options.desc = "Next diagnostic";
        }
      ];
    };
  };
}
