# install golang

if test ! "$(uname)" = "Darwin"
then
  sudo apt install -y golang
else
  brew install golang
fi
