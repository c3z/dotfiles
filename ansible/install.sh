# install ansible

if test ! "$(uname)" = "Darwin"
then
  sudo apt update
  sudo apt install -y software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible --yes
else
  echo "> installing ansible"
  brew install ansible
fi