# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
xcode-select --install

# Install yadr
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `"

# Install development environments
brew install nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

brew install pyenv

# Install packages & cask
brew install arp-scan
brew install ccrypt
brew install ctags
brew install jq
brew install lolcat
brew install nmap
brew install nyancat
brew install pwgen
brew install sl
brew install slackcat
brew install speedtest-cli
brew install todolist
brew install thefuck
brew install yarn
brew cask install divvy
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install ngrok
brew cask install onyx
brew cask install powershell
brew cask install slack
brew cask install visual-studio-code
brew cask install firefox

# Docker
brew install docker
brew cask install docker

# Amesh command
brew install go

# Write settings config
export LANG=ja_JP.UTF-8

# pyenv path
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# nodenv path
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc

# go path
echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >>~/.zshrc

# Write all alias
echo 'alias vscode="open -a Visual\ Studio\ Code"' >>~/.zshrc
echo 'alias firefox="open -a Firefox"' >>~/.zshrc
echo 'alias divvy="Divvy"' >>~/.zshrc
echo 'alias nightowl="open -a Night\ Owl"' >>~/.zshrc
echo 'alias slack="open -a Slack"' >>~/.zshrc
echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
echo 'alias ff="open -a FireFox"' >>~/.zshrc
echo 'alias github="ff http://github.com"' >>~/.zshrc
echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
echo 'alias ff="open -a FireFox"' >>~/.zshrc
echo 'alias github="ff http://github.com"' >>~/.zshrc

# misc install
source ~/.zshrc
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.6.3
nodenv install 10.1.0
go get github.com/otiai10/amesh/amesh

# misc setup
nodenv global 10.1.0
pyenv global 3.6.3

# history settings
echo 'HISTFILE=$HOME/.zsh-history' >>~/.zshrc
echo 'HISTSIZE=100000' >>~/.zshrc
echo 'SAVEHIST=1000000' >>~/.zshrc