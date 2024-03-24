if test ! $(command -v nvm)
then
  echo "no nvm found, installing"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
else
  echo "nvm found"
fi

if test ! $(which spoof)
then
  if test $(which npm)
  then
    sudo npm install spoof -g
  fi
fi

if test ! $(which bun)
then
  curl -fsSL https://bun.sh/install | bash
fi
