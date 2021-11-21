if test ! $(command -v pip3)
then
  echo "no pip3 found, installing"
  sudo apt install -y python3-pip
else
  echo "pip3 found"
fi
