if has('vim_starting')
    set nocompatible
    set runtimepath+=$HOME/dotfiles/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/unite.vim', 'cec560e'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'othree/html5.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/AnsiEsc.vim'

NeoBundle 'godlygeek/tabular'
" NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'basyura/unite-rails'
NeoBundle 'kana/vim-tabpagecd'
" NeoBundle 'Shougo/vimshell.git'
" NeoBundle 'Shougo/vimfiler.git'
" 
" NeoBundle 'vim-scripts/ruby-matchit.git' " % to jump from end
" NeoBundle 'vim-scripts/DrawIt.git'
" 
" NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/html5.vim'
" NeoBundle 'taichouchou2/vim-javascript'
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'tpope/vim-haml'
" 
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elzr/vim-json'

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

" Unite
" Unite prefix key.
nnoremap [unitee] <Nop>
nmap     <Space>u [unite]
" Unite keymap
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> [unite]f :<C-u>Unite<Space>file file/new -buffer-name=file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>

" unite-railsの一部キーマッピング。それぞれに結び付けたいんだけどどうすればいいんだろう
nnoremap <C-x> :Unite rails/
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" NERDTreeのパス表示をグラフィカルにしない
let g:NERDTreeDirArrows=0

" emmet
" langの値はja
let g:user_emmet_settings = { 'lang' : 'ja' }

" neocomplcache

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" vim-rails
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction
 
aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END
 
aug RailsDictSetting
  au!
aug END

"RSpec対応（vim-quickrun）
"横分割
let g:quickrun_config = {'*': {'split': ''}}
set splitbelow
set splitright
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '$HOME/.rbenv/shims/bundle exec', 'exec': '%o %c %s'}
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END 

" erb indent setting
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを出力する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" vim-jsonでダブルクオートを表示しない機能をオフにする
let g:vim_json_syntax_conceal = 0
