pkglist=(
abusaidm.html-snippets
CoenraadS.bracket-pair-colorizer
DavidAnson.vscode-markdownlint
dbaeumer.vscode-eslint
donjayamanne.githistory
eamodio.gitlens
eserozvataf.one-dark-pro-monokai-darker
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
GrapeCity.gc-excelviewer
jsjlewis96.one-dark-pro-italic-vivid
mechatroner.rainbow-csv
ms-python.python
ms-vscode.azurecli
ms-vscode.PowerShell
octref.vetur
oderwat.indent-rainbow
PeterJausovec.vscode-docker
PKief.material-icon-theme
shardulm94.trailing-spaces
zhuangtongfa.Material-theme
Zignd.html-css-class-completion
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done