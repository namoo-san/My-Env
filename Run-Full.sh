# Splash
echo "👀 WARNING"
echo "Full-Env setup script for macOS"
echo "This process takes 15 minutes⏰"
sleep 10

# Disable make .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores True

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

# Cask packages
cask_packages=(
  "google-chrome"
  "google-japanese-ime"
  "iterm2"
  "ngrok"
  "slack"
  "visual-studio-code"
  "firefox"
  "powershell"
  "homebrew/cask-versions/microsoft-remote-desktop-beta"
  "docker"
)

for package in "${cask_packages[@]}"; do
  echo "🎁 - 📦 ${package}"
  brew install --cask "${package}"
done

# Docker (also needs non-cask install)
echo "🎁 - 📦 docker (non-cask)"
brew install docker

# Regular packages
regular_packages=(
  "yarn"
  "arp-scan"
  "ccrypt"
  "ctags"
  "jq"
  "lolcat"
  "nmap"
  "nyancat"
  "pwgen"
  "sl"
  "slackcat"
  "speedtest-cli"
  "exa"
  "bat"
  "procs"
)

for package in "${regular_packages[@]}"; do
  echo "🎁 - 📦 ${package}"
  brew install "${package}"
done

# Write settings config
echo "🔧 Setting shell language..."
export LANG=ja_JP.UTF-8

# Environment paths
env_paths=(
  'export PYENV_ROOT="$HOME/.pyenv"'
  'export PATH="$PYENV_ROOT/bin:$PATH"'
  'eval "$(pyenv init -)"'
  'export PATH="$HOME/.nodenv/bin:$PATH"'
  'eval "$(nodenv init -)"'
  'export GOPATH=$HOME/go'
  'export PATH=$PATH:$GOPATH/bin'
)

echo "📝 Writing environments path..."
for path_config in "${env_paths[@]}"; do
  sudo echo "${path_config}" >> ~/.zshrc
done

# Write all alias
aliases=(
  'alias reload="exec $SHELL -l"'
  'alias vscode="open -a Visual\ Studio\ Code"'
  'alias firefox="open -a Firefox"'
  'alias divvy="Divvy"'
  'alias slack="open -a Slack"'
  'alias powershell="/usr/local/microsoft/powershell/6/pwsh"'
  'alias ff="open -a FireFox"'
  'alias github="ff http://github.com"'
)

echo "📝 Writing aliases..."
for alias_cmd in "${aliases[@]}"; do
  sudo echo "${alias_cmd}" >>~/.zshrc
done

# Apply zsh source
echo "🚃 Loading zsh source..."
source ~/.zshrc

# Install python/node/go versions
echo "💼 Install python 3.7.3..."
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.7.3
pyenv global 3.7.3

echo "💼 Install node 10.1.0..."
nodenv install 10.1.0
nodenv global 10.1.0

# Go packages
go_packages=(
  "github.com/otiai10/amesh/amesh"
  "github.com/golang/dep/cmd/dep"
)

for package in "${go_packages[@]}"; do
  echo "💼 Install go ${package}..."
  if [[ "${package}" == *"dep"* ]]; then
    go get -u "${package}"
  else
    go get "${package}"
  fi
done

# History settings
history_settings=(
  'HISTFILE=$HOME/.zsh-history'
  'HISTSIZE=100000'
  'SAVEHIST=1000000'
)

echo "📋 History settings..."
for setting in "${history_settings[@]}"; do
  sudo echo "${setting}" >>~/.zshrc
done

# VSCode settings
echo "🎨 Install VSCode plugins..."
sh "./VSCode-Plugins.sh"

echo "🎨 Install Ricty fonts..."
sh "./Ricty.sh"

echo "🔌 Reloading..."
sleep 3
reset

# Python packages install
echo "📦 Install python packages..."
pip install -r requirements.txt

# Jupyter lab
echo "📦 Install Jupyter Lab..."
pip install jupyterlab

# Done.
echo "⚡⚡⚡ Done! ⚡⚡⚡"
