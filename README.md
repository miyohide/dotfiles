# はじめに

このリポジトリにはvimの設定である.vimrcと.gvimrcを載せています。
# 使い方

1. git cloneする

git clone https://github.com/miyohide/dotfiles.git

2. vim用のバックアップ用ディレクトリを作る

`mkdir ~/vim_backupdir`

3. git cloneでneobundleを入れる

`cd ~/dotfiles`でカレントディレクトリを移動して、`git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/neobundle.vim.git`

4. シンボリックリンクを作成する

`~/.vimrc`と`~/.gvimrc`を`ln -s ~/dotfiles/_vimrc ~/.vimrc`と`ln -s ~/dotfiles/_gvimrc ~/.gvimrc`で作成する

5. vimで:NeoBundleInstallを実行する

