{ pkgs, ... }:
{
  home.packages = with pkgs; [ ghq ];
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
      v = "nvim";
    };
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "nvim";
      ll = "exa -l -g --icons -a";
      gg = "ghq get";
      k = "kubectl";
      ssh = "kitten ssh";
      grep = "rg";
      y = "yazi";
      c = "http";
      l = "ls -la";

      g = "git";
      gaa = "git add .";
      gd = "git diff";
      gl = "git pull";
      gup = "git pull --rebase";
      gp = "git push";
      gpf = "git push --force-with-lease";
      gc = "git commit";
      gcmsg = "git commit -m";
      "gc!" = "git commit --amend";
      gb = "git branch";
      gco = "git checkout";
      gba = "git branch -a";
      glo = "git log --oneline --graph --decorate --all";
      ga = "git add";
      gm = "git merge";
      gst = "git status";
      gsta = "git stash -u";
      gstp = "git stash pop";
      gstd = "git stash drop";
    };
    interactiveShellInit = ''
      set fish_greeting
      # NodeJS
      set -gx PATH node_modules/.bin $PATH
      function fish_user_key_bindings
          bind ctrl-shift-f custom_fzf_change_directory
      end
    '';
    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
    ];
    functions = {
      _custom_fzf_change_directory = {
        body = ''
          if [ (count $argv) ]
              fzf --layout=reverse --query="$argv " | perl -pe 's/([ ()])/\\\\$1/g' | read foo
          else
              fzf --layout=reverse | perl -pe 's/([ ()])/\\\\$1/g' | read foo
          end
          if [ $foo ]
              builtin cd $foo
              commandline -r ""
              commandline -f repaint
          else
              commandline ""
          end
        '';
      };
      custom_fzf_change_directory = {
        body = ''
          begin
              ghq list -p
              ls -ad * | perl -pe "s#^#$PWD/#" | grep -v \.git
              ls -ad $HOME/Developments/*/* | grep -v \.git
              ls -ad $HOME/nixos-config/**/*/
          end | sed -e 's/\/$//' | awk '!a[$0]++' | _custom_fzf_change_directory $argv
        '';
      };
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };
}
