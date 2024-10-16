#!/usr/bin/env zsh
#
# Modified from: https://github.com/junegunn/fzf/wiki/examples
#
# Depends on the `fzf` binary
# Based on: https://gist.github.com/wandsas/3f48ceb7d592430c8fe6341ac44ace13
# See: https://github.com/junegunn/fzf#installation
if hash fzf &>/dev/null; then 
  ############################ General examples
  # vim **<TAB> 
  # vim ../fzf**<TAB>
  # vim ~/**<TAB>
  # vim ../**<TAB>
  
  # cd **<TAB>
  # cd ~/github/fzf**<TAB>
  
  # Can select multiple processes with <TAB> or <Shift-TAB> keys
  # kill -9 <TAB>
  
  # ssh **<TAB>
  # telnet **<TAB>
  
  ############################ Settings
  # source "${0:r:r}.zsh" # antibody takes care of this
  
  if hash ag &>/dev/null; then 
    # Set ag as the default source for fzf
    export FZF_DEFAULT_COMMAND='ag -l -g ""'
    # Apply the command to CTRL-T as well
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
  
  ############################ Git operations 
  fglog() {
    git log --oneline --decorate --color | fzf --ansi --preview 'git show $(echo {} | cut -d" " -f1)'
  }
  
  ############################ Opening files 
  # fe [FUZZY PATTERN] - Open the selected file with the default editor
  #   - Bypass fuzzy finder if there's only one match (--select-1)
  #   - Exit if there's no match (--exit-0)
  fe() {
    local file
    file=$(fzf --cycle --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && ${EDITOR:-vim} "$file"
  }
  
  # Modified version where you can press
  #   - CTRL-O to open with `open` command,
  #   - CTRL-E or Enter key to open with the $EDITOR
  fo() {
    local out file key
    out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
    key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
    if [ -n "$file" ]; then
      [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
    fi
  }
  
  ############################ Removing files 
  frm() {
    local file
    file=$(fzf --cycle +m) && rm -rfi "$file"
  }
  
  ############################ Changing directories
  # fd - cd to selected directory
  fd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
                    -o -type d -print 2> /dev/null | fzf --cycle +m) &&
    cd "$dir"
  }
  
  # fda - including hidden directories
  fda() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf --cycle +m) && cd "$dir"
  }

  fcd() {
    local dir;

    while true; do
      # exit with ^D
      dir="$(gls -a1p | grep '/$' | fzf --height 40% --reverse --no-multi --preview 'pwd' --preview-window=up,1,border-none --no-info)"
      if [[ -z "${dir}" ]]; then
        break
      else
        cd "${dir}"
      fi
    done    
  }
  
  # FIXME: I am not sure this is working- always cd's to ~/Desktop on OS X
  # cdf - cd into the directory of the selected file
  cdf() {
     local file
     local dir
     file=$(fzf --cycle +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
  }
  
  ############################ fasd
  if hash fasd &>/dev/null; then 
    # fj - changing directory with fasd;
    # like normal fasd if used with no arguements
    fj() {
     if [[ -z "$*" ]]; then
        local dir
        dir=$(fasd -Rdl | fzf --cycle --no-sort +m) && cd "$dir"
      else 
        fasd_cd -d "$@"
      fi
    }
    alias j=fj
  fi
  
  ############################ z
  # TODO: best way to test if z is installed?
  if [[ -n "$_Z_CMD" ]]; then
    unalias z 2> /dev/null
    # like normal z when used with arguments 
    # but displays an fzf prompt when used without.
    z() {
      if [[ -z "$*" ]]; then
        cd "$(_z -l 2>&1 | fzf --cycle +s --tac | sed 's/^[0-9,.]* *//')"
      else
        _last_z_args="$@"
        _z "$@"
      fi
    }
    # supports relaunching z with the arguments for the 
    # previous command as the default input by using zz
    zz() {
      cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --cycle -q $_last_z_args)"
    }
    alias j=z
    alias jj=zz
  fi
  
  ############################ Command history
  # fh - repeat history
  fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --cycle +s --tac | sed 's/ *[0-9]* *//')
  }
  
  ############################ Searching file contents
  # with ag - respects .agignore and .gitignore
  fs() {
    if hash ag &>/dev/null; then 
      ag --nobreak --nonumbers --noheading . | fzf
    else
      grep --line-buffered --color=never -r "" * | fzf
    fi
  }
  
  ############################ Processes
  # fkill - kill process
  fkill() {
    pid=$(ps -ef | sed 1d | fzf --cycle -m | awk '{print $2}')
  
    if [ "x$pid" != "x" ]
    then
      kill -${1:-9} $pid
    fi
  }
  
  ############################ Git
  # fbr - checkout git branch
  fbr() {
    local branches branch
    branches=$(git branch) &&
    branch=$(echo "$branches" | fzf --cycle +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
  }
  
  # fbr - checkout git branch (including remote branches)
  fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
             fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }
  
  # fco - checkout git branch/tag
  fco() {
    local tags branches target
    tags=$(
      git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(
      git branch --all | grep -v HEAD             |
      sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
      sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$(
      (echo "$tags"; echo "$branches") |
      fzf-tmux -l30 -- --no-hcycle --ansi +m -d "\t" -n 2) || return
    git checkout $(echo "$target" | awk '{print $2}')
  }
  
  # fcoc - checkout git commit
  fcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --cycle --tac +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
  }
  
  # fshow - git commit browser
  fshow() {
    local out sha q
    while out=$(
        git log --decorate=short --graph --oneline --color=always |
        fzf --cycle --ansi --multi --no-sort --reverse --query="$q" --print-query); do
      q=$(head -1 <<< "$out")
      while read sha; do
        [ -n "$sha" ] && git show --color=always $sha | less -R
      done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    done
  }
  
  # fcs - get git commit sha
  # example usage: git rebase -i `fcs`
  fcs() {
    local commits commit
    commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --cycle --tac +s +m -e --ansi --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
  }
  freb() {
    local commit=$(fcs)
    [[ -n "$commit" ]] && git rebase -i "$commit"
  }
  
  # fstash - easier way to deal with stashes
  # type fstash to get a list of your stashes
  # enter shows you the contents of the stash
  # ctrl-d shows a diff of the stash against your current HEAD
  # ctrl-b checks the stash out as a branch, for easier merging
  fstash() {
    local out q k sha
      while out=$(
        git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
        fzf --cycle --ansi --no-sort --query="$q" --print-query \
            --expect=ctrl-d,ctrl-b);
      do
        q=$(head -1 <<< "$out")
        k=$(head -2 <<< "$out" | tail -1)
        sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
        [ -z "$sha" ] && continue
        if [ "$k" = 'ctrl-d' ]; then
          git diff $sha
        elif [ "$k" = 'ctrl-b' ]; then
          git stash branch "stash-$sha" $sha
          break;
        else
          git stash show -p $sha
        fi
      done
  }
  
  ############################ tmux
  # fsesh [FUZZY PATTERN] - Select selected tmux session
  #   - Bypass fuzzy finder if there's only one match (--select-1)
  #   - Exit if there's no match (--exit-0)
  fsesh() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
      fzf --cycle --query="$1" --select-1 --exit-0) &&
    tmux switch-client -t "$session"
  }
  
  # ftpane - switch pane
  ftpane () {
    local panes current_window target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_window=$(tmux display-message  -p '#I')
  
    target=$(echo "$panes" | fzf) || return
  
    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
  
    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
      tmux select-window -t $target_window
    fi
  }
  
  ############################ locate/mdfind
  # FIXME
  # ALT-I - Paste the selected entry from locate output into the command line
  fzf-locate-widget() {
    local binary
    if [[ "$OSTYPE" =~ ^(darwin)+ ]]; then 
      binary=mdfind
    else
      binary=locate
    fi
    local selected
    if selected=$($binary / | fzf --cycle -q "$LBUFFER"); then
      LBUFFER=$selected
    fi  
    zle redisplay
  }
  zle     -N    fzf-locate-widget
  bindkey '\ei' fzf-locate-widget
fi