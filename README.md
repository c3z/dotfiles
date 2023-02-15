# c3z dotfiles

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone git@github.com:c3z/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## fresh install on new machine

### ubuntu

```sh
sudo apt-get update -y
sudo apt install -y zsh gcc make  libssl-dev libreadline-dev curl git zlib1g-dev g++
cd ~/.dotfiles/
script/install
unset NVM_DIR
script/install
script/bootstrap
zsh
nvm install 14.15.3
rbenv install 3.0.0
rbenv global 3.3.0
script/install

```

### macosx m1

```sh
git --version
cd ~/.dotfiles/
script/install
unset NVM_DIR
script/install
script/bootstrap
zsh
nvm install 14.15.3
rbenv install 3.0.0
rbenv global 3.3.0
script/install

```

## TODO

[ ] add full install from here: https://towardsdatascience.com/new-m1-who-dis-677e085baffd
[ ] add new tools

bat instead of cat
diff-so-fancy
fx
fzf
exa
duff
htop
hexyl
fig
curlx
grv

## Installing tensorflow on m1

```sh
conda create -n tf python=3.9
conda activate tf

# Install apple tensorflow dependencies
conda install -c apple tensorflow-deps

# Install tensorflow macos
python -m pip install tensorflow-macos==2.9

# Install tensorflow metal plugin
python -m pip install tensorflow-metal==0.5.0

# Install tensorflow readymade datasets
python -m pip install tensorflow-datasets

# Install libjpeg (needed by mathplotlib)
brew install libjpeg

# Install mathplotlib and jupyterlab
conda install -y matplotlib jupyterlab
```

Verify using this script

```py
import tensorflow as tf

cifar = tf.keras.datasets.cifar100
(x_train, y_train), (x_test, y_test) = cifar.load_data()
model = tf.keras.applications.ResNet50(
    include_top=True,
    weights=None,
    input_shape=(32, 32, 3),
    classes=100,)

loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
model.compile(optimizer="adam", loss=loss_fn, metrics=["accuracy"])
model.fit(x_train, y_train, epochs=5, batch_size=64)
```
