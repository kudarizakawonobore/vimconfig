" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" ハイライトを有効化する
syntax enable
autocmd BufNewFile,BufRead *.pdf.thinreports set filetype=ruby
autocmd BufNewFile,BufRead *.js.coffee set filetype=javascript
autocmd BufRead,BufNewFile *.gradle setfiletype groovy

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab
set tabstop=2
set shiftwidth=2

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" 画面表示上で折り返しをしない
set nowrap

" 挿入モードに入るとき、前回の挿入モードにおけるIMEの状態を復元する
set t_SI+=[<r
" 挿入モードを出るとき、現在のIMEの状態を保存し、IMEをオフにする
set t_EI+=[<0t[<s
" vim 終了時、IMEをOFFにする
set t_te+=[<0t[<s
set ttimeoutlen=100

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

"----------------------------------
" Dein.vim
" ---------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/etc/myvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/etc/myvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('mrk21/yaml-vim')
call dein#add('tpope/vim-endwise')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" NERDTree設定
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let NERDTreeWinSize=40
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
   autocmd VimEnter * NERDTree ./
endif
":command! NERDTree NERDTreeTabsToggle
nnoremap <silent><C-n> :NERDTreeTabsToggle<CR>

" mycmd
" sed word
nnoremap <expr> + ':%s /\<' . expand('<cword>') . '\>/'
" insert Cr
nnoremap <CR> o<ESC>
" very magic mode
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//
nnoremap <C-K> :%smagic/
" move on insert mode 
"inoremap <C-L> <Right>
"inoremap <C-J> <Down>
"inoremap <C-H> <Left>
"inoremap <C-K> <Up>
