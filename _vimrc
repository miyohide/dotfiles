" plugin管理（nocompatible）
:set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=$HOME/dotfiles/.vim/neobundle.vim.git
    call neobundle#rc(expand('~/dotfiles/.bundle'))
endif

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tomtom/tcomment_vim.git'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/ruby-matchit.git' " % to jump from end
NeoBundle 'vim-scripts/DrawIt.git'

filetype plugin on
filetype indent on

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
autocmd FileType ruby set ai tabstop=3 shiftwidth=3 softtabstop=0 et
" テキストモードの時の横幅は無制限
autocmd FileType text set ai textwidth=0 et

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" quick-run
set splitbelow "新しいウィンドウを下に開く

" Neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


