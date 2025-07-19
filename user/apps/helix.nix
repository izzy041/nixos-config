{ pkgs, config, ...}:
{
  programs.helix = {
    enable = true;

    extraPackages = [
      pkgs.nil
      pkgs.nixd
    ];
    
    settings = {
      theme = "tokyonight";
      editor = {
      	line-number = "relative";
      	shell = [ "zsh" "-c" ];
      	completion-timeout = 5;
      	mouse = false;
      	bufferline = "always";
      	end-of-line-diagnostics = "hint";
      	inline-diagnostics = {
      	  cursor-line = "error";
      	};
      	cursor-shape = {
      	  insert = "bar";
      	};
      	file-picker = {
      	  hidden = false;
      	};
      	lsp = {
      	  display-messages = true;
      	};
      	indent-guides = {
      	  render = true;
      	  character = "|";
      	  skip-levels = 1;
      	};
      };
    };    
  };
}
