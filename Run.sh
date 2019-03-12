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
# brew cask install divvy
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install ngrok
# brew cask install onyx
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
sudo echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
sudo echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
sudo echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# nodenv path
sudo echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
sudo echo 'eval "$(nodenv init -)"' >> ~/.zshrc

# go path
sudo echo 'export GOPATH=$HOME/go' >> ~/.zshrc
sudo echo 'export PATH=$PATH:$GOPATH/bin' >>~/.zshrc

# Write all alias
sudo echo 'alias vscode="open -a Visual\ Studio\ Code"' >>~/.zshrc
sudo echo 'alias firefox="open -a Firefox"' >>~/.zshrc
sudo echo 'alias divvy="Divvy"' >>~/.zshrc
sudo echo 'alias nightowl="open -a Night\ Owl"' >>~/.zshrc
sudo echo 'alias slack="open -a Slack"' >>~/.zshrc
sudo echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
sudo echo 'alias ff="open -a FireFox"' >>~/.zshrc
sudo echo 'alias github="ff http://github.com"' >>~/.zshrc
sudo echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
sudo echo 'alias ff="open -a FireFox"' >>~/.zshrc
sudo echo 'alias github="ff http://github.com"' >>~/.zshrc

# misc install
source ~/.zshrc
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.6.3
nodenv install 10.1.0
go get github.com/otiai10/amesh/amesh

# misc setup
nodenv global 10.1.0
pyenv global 3.6.3

# history settings
sudo echo 'HISTFILE=$HOME/.zsh-history' >>~/.zshrc
sudo echo 'HISTSIZE=100000' >>~/.zshrc
sudo echo 'SAVEHIST=1000000' >>~/.zshrc

# Ricty install
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

sh ./VSCode-Plugins.sh
