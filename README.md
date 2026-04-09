# My-Env

macOS 向けの開発環境セットアップ repo

2026 時点でかなり古くなっていた構成を整理して
今は `brew bundle` + `mise` + VS Code互換エディタ拡張 の最小構成に寄せている

## 方針

- パッケージ管理: Homebrew + `Brewfile`
- 言語ランタイム: `mise`
- エディタ: Cursor / VS Code / Windsurf みたいな VS Code互換エディタを想定
- 拡張一覧: `editors/extensions.txt`
- dotfiles: repo には含めない
  - 旧 `YADR` は完全に対象外
  - 必要なら `chezmoi` か自前 repo で分離管理

## セットアップ

```bash
cd ~/dev/My-Env
./bootstrap.sh
```

これでやること

- Homebrew の導入確認
- `brew bundle` で CLI / GUI ツール導入
- `mise` で Node.js / Python 導入
- 利用可能なら editor CLI で拡張一括導入
  - 優先順: `cursor` → `code` → `windsurf`

## エディタ拡張だけ入れたいとき

```bash
./install-editor-extensions.sh
```

`editors/extensions.txt` を見て
使える CLI に対してまとめて入れる

## いま残しているもの

- `bootstrap.sh` : セットアップ入口
- `Brewfile` : Homebrew 管理対象
- `.mise.toml` : Node.js / Python バージョン
- `editors/extensions.txt` : VS Code互換拡張の共通リスト
- `install-editor-extensions.sh` : 拡張一括導入
- `iTerm2-Settings/` : iTerm2 設定バックアップ

## 今回切ったもの

- `Run-Full.sh`
- `Run-Light.sh`
- `Ricty.sh`
- `requirements.txt`
- `VSCode.extension`
- `VSCode-Plugins.sh`
- `install-vscode-extensions.sh`
- `vscode/` ディレクトリ

残しておく理由が薄かった
特にこのへんは 旧 macOS / 旧 VS Code / 旧 Python 環境前提の名残で
今の再現性や保守性をむしろ落としてた

## 変更メモ

- `nodenv` / `pyenv` 系の分離管理はやめて `mise` に統一
- `python@2` や古い固定 runtime 前提はやめた
- `Ricty` 前提は廃止
  - いま選ぶなら `HackGen` `UDEV Gothic` `JetBrains Mono Nerd Font` あたりのほうが楽
- `eza` 導入に合わせて `ls` `l` `la` `ll` `tree` の alias を自動で追加
  - 旧環境で自然に使っていた一覧系コマンドをなるべくそのまま移行できるようにしてある
- VS Code専用スクリプトはやめて VS Code互換エディタ共通運用に変更
- 古い拡張 ID は整理済み
  - `Bracket Pair Colorizer` は不要
  - `Vetur` より `Vue.volar`
  - `PeterJausovec.vscode-docker` より `ms-azuretools.vscode-docker`

## トレードオフ

- 旧スクリプト互換は捨てた
  - 昔のファイル名を直接叩く運用は壊れる
- Python パッケージ一式の自動投入もやめた
  - グローバル `requirements.txt` 方式は再現性が低く 用途不明な依存を抱えやすい
  - Python 依存は各プロジェクトごとに `uv` / `pip` / `pyproject.toml` 側で管理する前提
- エディタは VS Code互換に寄せている
  - Neovim 専用や JetBrains 専用の設定 repo ではない

## 補足

Docker は `docker` cask で Docker Desktop を入れる構成
CLI だけでいいなら Colima + docker formula に寄せたほうが軽い
