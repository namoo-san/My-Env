# Splash
echo "👀 WARNING"
echo "Light-Env setup script for macOS"
echo "This process takes 15 minutes⏰"
sleep 10

# Install Homebrew
echo "🎁 Install Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
xcode-select --install

# Install yadr
echo "🎁 Install YADR..."
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `"

# Install development environments
echo "🎁 Install nodenv..."
brew install nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

echo "🎁 Install pyenv..."
brew install pyenv

# Install packages & cask
echo "🎁 Install Homebrew dependences..."

echo "🎁 - 📦 yarn"
brew install yarn

echo "🎁 - 📦Google Chrome"
brew cask install google-chrome

echo "🎁 - 📦Google Japanese IME"
brew cask install google-japanese-ime

echo "🎁 - 📦iTerm2"
brew cask install iterm2

echo "🎁 - 📦ngrok"
brew cask install ngrok

echo "🎁 - 📦Slack"
brew cask install slack

echo "🎁 - 📦VSCode"
brew cask install visual-studio-code

echo "🎁 - 📦Firefox"
brew cask install firefox

echo "🔧 - Some miscellaneous"
brew install exa
brew install bat
brew install procs

# Write settings config
echo "🔧 Setting shell language..."
export LANG=ja_JP.UTF-8

# pyenv path
echo "📝 Writing environments path... - 📍 pyenv"
sudo echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
sudo echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
sudo echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# nodenv path
echo "📝 Writing environments path... - 📍 nodenv"
sudo echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
sudo echo 'eval "$(nodenv init -)"' >> ~/.zshrc

# go path
echo "📝 Writing environments path... - 📍 go"
sudo echo 'export GOPATH=$HOME/go' >> ~/.zshrc
sudo echo 'export PATH=$PATH:$GOPATH/bin' >>~/.zshrc

# Write all alias
echo "📝 Writing environments path... - 🚩 Alias"
sudo echo 'alias vscode="open -a Visual\ Studio\ Code"' >>~/.zshrc
sudo echo 'alias firefox="open -a Firefox"' >>~/.zshrc
sudo echo 'alias divvy="Divvy"' >>~/.zshrc
sudo echo 'alias slack="open -a Slack"' >>~/.zshrc
sudo echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
sudo echo 'alias ff="open -a FireFox"' >>~/.zshrc
sudo echo 'alias github="ff http://github.com"' >>~/.zshrc
sudo echo 'alias powershell="/usr/local/microsoft/powershell/6/pwsh"' >>~/.zshrc
sudo echo 'alias ff="open -a FireFox"' >>~/.zshrc
sudo echo 'alias github="ff http://github.com"' >>~/.zshrc

# Apply zsh source
echo "🚃 Loading zsh source..."
source ~/.zshrc

# Install python/node/go versions
echo "💼 Install python 3.6.3..."
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.6.3

echo "💼 Install node 10.1.0..."
nodenv install 10.1.0

echo "💼 Install go amesh..."
go get github.com/otiai10/amesh/amesh

echo "💼 Install go dep..."
go get -u github.com/golang/dep/cmd/dep

echo "🙆 node 10.1.0"
nodenv global 10.1.0

echo "🙆 python 3.6.3"
pyenv global 3.6.3

# History settings
echo "📋 History settings..."
sudo echo 'HISTFILE=$HOME/.zsh-history' >>~/.zshrc
sudo echo 'HISTSIZE=100000' >>~/.zshrc
sudo echo 'SAVEHIST=1000000' >>~/.zshrc

# Done.
echo "⚡⚡⚡ Done! ⚡⚡⚡"