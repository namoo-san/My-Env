# [README]
# Run on zsh
# - Homebrew
# - YADR
# - Prezto

# Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Homebrew/bundle

# yadr

sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `"

# Prezto

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# cp .zshrc

\cp -f .zshrc ~/

# .zshrc source

source ~/.zshrc

# pyenv install / global

pyenv install 3.6.3

pyenv global 3.6.3

# nodenv install / global

nodenv install 10.1.0

nodenv global 10.1.0

