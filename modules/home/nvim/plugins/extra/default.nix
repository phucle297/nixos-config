{ pkgs, ... }:
let
  logsitter = pkgs.vimUtils.buildVimPlugin {
    name = "logsitter";
    src = pkgs.fetchFromGitHub {
      owner = "gaelph";
      repo = "logsitter.nvim";
      hash = "sha256-RK1MUhA/0aG04czbs0vqtXe27NxBS4si2+kENUlYYhU=";
      rev = "95e2b43b52936c48bb1b52f101847c574d06c6b0";
    };
    nvimSkipModule = "logsitter";
  };
  moody = pkgs.vimUtils.buildVimPlugin {
    name = "moody";
    src = pkgs.fetchFromGitHub {
      owner = "svampkorg";
      repo = "moody.nvim";
      hash = "sha256-n/9BeQSf8K1lboudFL1OiB2c8ZY6HoI9ROx54nF+5HY=";
      rev = "263f5f89277f40932c1cd7aca010bd38256fda17";
    };
    nvimSkipModule = "moody.statuscolumn";
  };
in
{
  programs.nixvim = {
    extraPlugins = [
      logsitter
      moody
    ];
  };

}
