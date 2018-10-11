" 色
colorscheme murphy

" ステータスラインの設定（ファイル名、タイプ、フォーマット、エンコード、行数）
:set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
" ステータスラインを常に表示
:set laststatus=2
" バックアップファイルの作り先の指定
:set backupdir=$HOME/vim_bk
:set directory=$HOME/vim_bk

" 行数を出す
set number

" シンタックスハイライト
syntax on

" 保存していなくても別のファイルを表示できるようにする
:set hidden

" インクリメンタルサーチ
:set incsearch

" タブの幅は2
:set tabstop=2
:set shiftwidth=2
:set softtabstop=0

" タブの入力を空白文字にする
:set expandtab
" 対応するカッコを目立たせる
:set showmatch

" テキストモードの時の横幅は無制限
autocmd FileType text set ai textwidth=0 et
autocmd FileType markdown set ai textwidth=0 et

" Vim 7.4.227から有効化されたundofileの生成を無効化
:set noundofile

" 音を消す
set vb t_vb=

" 記号なども2バイトの幅に
set ambiwidth=double

