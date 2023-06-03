#!/bin/bash
#
function clone_if_not_exists() {
  local repo_url="https://github.com/tmux-plugins/tpm"
  local target_dir="${HOME}/.tmux/plugins/tpm"

  if [[ ! -d "${target_dir}" ]]; then
    echo "Tmux tpm plugin does not exist, cloning repository..."
    git clone "${repo_url}" "${target_dir}"
  else
    echo "Plugin already exists, skipping."
  fi
}

brew install "tmux"
clone_if_not_exists

