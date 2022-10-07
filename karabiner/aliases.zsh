if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

local karabiner_config_local="$HOME/.config/karabiner"
local karabiner_config_repo="$HOME/.dotfiles/karabiner/config"

karsync_upload() {
  echo "Coping local karabiner config to .dotfiles repo"
  rsync -avz --delete $karabiner_config_local $karabiner_config_repo
}

karsync_download() {
  echo "Coping karabiner config from github repo to local config"
  local curent_path=$(pwd)
  cd $HOME/.dotfiles
  git pull
  rsync -avz --delete $karabiner_config_repo $karabiner_config_local 
  cd $curent_path
}