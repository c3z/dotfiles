alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

function echo_color() {
  printf "\033[0;90m$1\033[0m\n"
}

alias gosleep='pmset sleepnow'

alias ws='open -na "WebStorm.app" --args "$@"'
alias pc='open -na "PyCharm.app" --args "$@"'
alias vim='nvim "$@"'

