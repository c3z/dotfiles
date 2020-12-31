# install golang

if test ! "$(uname)" = "Darwin"
then
  sudo apt install -y golang
else
  arch -x86_64 brew install golang
fi