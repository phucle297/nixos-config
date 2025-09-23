{
  programs.git = {
    enable = true;
    userEmail = "permees@nexondv.com";
    userName = "Le Dam Duy Phuc";
    aliases = {
      g = "git";
      gst = "status";
      gd = "diff";
      gdc = "diff --cached";
      gl = "pull";
      gup = "pull --rebase";
      gp = "push";
      gdv = "!git diff -w $@ | view -"; # function -> shell alias
      gc = "commit -v";
      gca = "commit -v -a";
      gcmsg = "commit -m";
      gco = "checkout";
      gcm = "checkout master";
      gr = "remote";
      grv = "remote -v";
      grmv = "remote rename";
      grrm = "remote remove";
      grset = "remote set-url";
      grup = "remote update";
      grbi = "rebase -i";
      grbc = "rebase --continue";
      grba = "rebase --abort";
      gb = "branch";
      gba = "branch -a";
      gcount = "shortlog -sn";
      gcl = "config --list";
      gcp = "cherry-pick";
      glg = "log --stat --max-count=10";
      glgg = "log --graph --max-count=10";
      glgga = "log --graph --decorate --all";
      glo = "log --oneline";
      gss = "status -s";
      ga = "add";
      gm = "merge";
      grh = "reset HEAD";
      grhh = "reset HEAD --hard";
      gclean = "!git reset --hard && git clean -dfx";
      gwc = "whatchanged -p --abbrev-commit --pretty=medium";
      gpoat = "!git push origin --all && git push origin --tags";
      gmt = "mergetool --no-prompt";
      gg = "gui citool";
      gga = "gui citool --amend";
      gk = "gitk --all --branches";
      gsts = "stash show --text";
      gsta = "stash";
      gstp = "stash pop";
      gstd = "stash drop";
      grt = "!cd $(git rev-parse --show-toplevel || echo .)";
      git-svn-dcommit-push = "!git svn dcommit && git push github master:svntrunk";
      gsr = "svn rebase";
      gsd = "svn dcommit";
      ggpull = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      ggpur = "!git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)";
      ggpush = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      ggpnp = "!git pull origin $(git rev-parse --abbrev-ref HEAD) && git push origin $(git rev-parse --abbrev-ref HEAD)";
      glp = "!f() { git log --pretty=$1; }; f";
      gwip = "!git add -A && git ls-files --deleted -z | xargs -0 git rm && git commit -m 'wip'";
      gunwip = "!git log -n 1 | grep -q -c wip && git reset HEAD~1";
      gaa = "add .";
      gpf = "push --force-with-lease";
      glol = "log --oneline --decorate --graph";
      gcoll = "!git checkout develop && git pull";
      # a = "!git status --short | peco | awk '{print $2}' | xargs git add";
      # d = "diff";
      # co = "checkout";
      # ci = "commit";
      # ca = "commit -a";
      # ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      # pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      # st = "status";
      # br = "branch";
      # ba = "branch -a";
      # bm = "branch --merged";
      # bn = "branch --no-merged";
      # df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
      # hist = "log --pretty=format:'%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)' --graph --date=relative --decorate --all";
      # llog = "log --graph --name-status --pretty=format:'%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset' --date=relative";
    };
    extraConfig = {
      core = {
        editor = "nvim";
        ignorecase = false;
      };
      ghq = {
        root = "~/Developments";
      };
      push = {
        default = "simple";
      };
      pull = {
        rebase = true;
      };
      # http = {
      # sslCAInfo = "/etc/ssl/certs/cert.crt";
      # };
    };
  };
}
