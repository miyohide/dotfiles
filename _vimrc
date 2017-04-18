if has('vim_starting')
    set nocompatible
    set runtimepath+=$HOME/dotfiles/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim', 'ver.6.3'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'

call neobundle#end()

filetype plugin indent on

" 色
colorscheme murphy

" ステータスラインの設定（ファイル名、タイプ、フォーマット、エンコード、行数）
:set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
" ステータスラインを常に表示
:set laststatus=2
" バックアップファイルの作り先の指定
:set backupdir=$HOME/vim_backupdir
:set directory=$HOME/vim_backupdir

" 行数を出す
set number

" シンタックスハイライト
syntax on

" 保存していなくても別のファイルを表示できるようにする
:set hidden

" インクリメンタルサーチ
:set incsearch

" タブの幅は4
:set tabstop=4
:set shiftwidth=4
:set softtabstop=0

" タブの入力を空白文字にする
:set expandtab
" 対応するカッコを目立たせる
:set showmatch

" Ruby用の設定
autocmd FileType ruby set ai tabstop=2 shiftwidth=2 softtabstop=0 et
" テキストモードの時の横幅は無制限
autocmd FileType text set ai textwidth=0 et
autocmd FileType markdown set ai textwidth=0 et

" Vim 7.4.227から有効化されたundofileの生成を無効化
:set noundofile

" 音を消す
set vb t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
nnoremap [unite] <Nop>
nmap <Space>u [unite]

"カレントディレクトリ下のファイル一覧。
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file file/new directory/new<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

" insert modeで開始
call unite#custom#profile('default', 'context', {
\   'start_insert': 1
\ })

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

