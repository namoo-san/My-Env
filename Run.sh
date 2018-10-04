# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install yadr
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `"

# Copy zshrc
\cp -f .zshrc ~/

# Install development environments
brew install nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

xcode-select --install
nodenv install 10.1.0
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.6.3

# Install packages & cask
brew install arp-scan
brew install ccrypt
brew install ctags
brew install jq
brew install lolcat
brew install nmap
brew install nyancat
brew install peco
brew install pwgen
brew install sl
brew install slackcat
brew install speedtest-cli
brew install todolist
brew install thefuck
brew install yarn
brew cask install alfred
brew cask install atom
brew cask install divvy
brew cask install google-chrome
brew cask install google-drive-file-stream
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install ngrok
brew cask install onyx
brew cask install powershell
brew cask install slack
brew cask install visual-studio-code

# Settings
source ~/.zshrc
pyenv global 3.6.3
nodenv global 10.1.0