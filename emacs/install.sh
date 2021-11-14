
if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

echo "› brew install emacs-mac --with-modules"
brew install emacs-mac --with-modules

echo "› ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app"
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app

echo "› Installing doom emacs"

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
cd ~/.emacs.d
git checkout develop
cd
~/.emacs.d/bin/doom install
