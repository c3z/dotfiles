if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

local nvim_config_local="$HOME/.config/nvim"
local nvim_config_repo="$HOME/.dotfiles/nvim/config"

nvimsync_upload() {
  echo "Coping local nvim config to .dotfiles repo"
  rsync -ravz --delete "$nvim_config_local/" "$nvim_config_repo"
}

nvimsync_download() {
  echo "Coping nvim config from github repo to local config"
  local curent_path=$(pwd)
  cd $HOME/.dotfiles
  git pull
  rsync -ravz --delete "$nvim_config_repo/" "$nvim_config_local" 
  cd $curent_path
}