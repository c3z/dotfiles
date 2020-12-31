# install ruby with rbenv

if test ! "$(uname)" = "Darwin"
then
  echo "> installing rbenv using curl scripts"
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
else
  echo "> installing rbenv using brew"
  arch -x86_64 brew install rbenv
fi