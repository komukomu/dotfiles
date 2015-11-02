"--------------------------
" vimrc
"--------------------------

"" Start Neobundle Setting.
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"" add Plugin
" NERDTree
NeoBundle 'scrooloose/nerdtree'
" syntastic check
NeoBundle 'scrooloose/syntastic'
" Unite
NeoBundle 'Shougo/unite.vim'
" VimFiler
NeoBundle 'Shougo/vimfiler'
" コメントON/OFFを手軽に実行する
NeoBundle 'tomtom/tcomment_vim'
" lightline
NeoBundle 'itchyny/lightline.vim'
 let g:lightline = {
         \ 'colorscheme': 'wombat',
         \ 'mode_map': {'c': 'NORMAL'},
         \ 'active': {
         \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
         \ },
         \ 'component_function': {
         \   'modified': 'LightLineModified',
         \   'readonly': 'LightLineReadonly',
         \   'fugitive': 'LightLineFugitive',
         \   'filename': 'LightLineFilename',
         \   'fileformat': 'LightLineFileformat',
         \   'filetype': 'LightLineFiletype',
         \   'fileencoding': 'LightLineFileencoding',
         \   'mode': 'LightLineMode'
         \ }
         \ }

 function! LightLineModified()
     return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
 endfunction

 function! LightLineReadonly()
     return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
 endfunction

 function! LightLineFilename()
     return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
	 \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
	 \  &ft == 'unite' ? unite#get_status_string() :
	 \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
	 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
 endfunction

 function! LightLineFugitive()
     try
	 if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
	     return fugitive#head()
	 endif
     catch
     endtry
     return ''
 endfunction

 function! LightLineFileformat()
     return winwidth(0) > 70 ? &fileformat : ''
 endfunction

 function! LightLineFiletype()
     return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
 endfunction

 function! LightLineFileencoding()
     return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
 endfunction

 function! LightLineMode()
     return winwidth(0) > 60 ? lightline#mode() : ''
 endfunction

" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tukiyo/previm'

" QuickRun
NeoBundleLazy 'git://github.com/thinca/vim-quickrun.git', {
	    \ 'autoload':{
	    \ 'commands': "QuickRun"
	    \ }}

"" Snippet
" 補完
NeoBundle 'Shougo/neocomplcache'
" snippet補完
NeoBundle 'Shougo/neosnippet'
" 各種snippet
NeoBundle 'Shougo/neosnippet-snippets'

"" Nnoremap
" NERDTree
nnoremap <Silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt       "タブ間の移動
nnoremap <C-p> gT       "タブを閉じる
nnoremap <C-c> closetab "タブを閉じる

" Ctrl+j, k, h, l でウインドウを移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" Set
" 新しい行のインデントを現在行と同じにする
set autoindent
" 行番号表示
set number
" タブを常に表示
set showtabline=4
" ステータスラインを常に表示
set laststatus=2
" backspaceで文字を削除可能
set backspace=start,eol,indent
" 特定のキーに行頭、行末に回りこみ移動
set whichwrap=b,s,h,l,<,>,[,]
" マウス機能有効化
set mouse=a
" カーソルラインの強調表示
set cursorline
" カーソルが何行目の何列目に置かれているかを表示する
"set ruler
" 検索キーワードをハイライトしない
set nohlsearch
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" シフト移動幅
set shiftwidth=4
" 新しい行で自動インデントを行う
set smarttab
" 対応する括弧を強調する
set showmatch
" backupを作らない
set nobackup
" undofile
set undodir=~/vim/undo

"---文字設定関連---
" ヘルプの日本語化プラグインの設定
set helplang=ja,en
" 標準コード設定(UTF-8)
set encoding=utf-8
" 文字自動判設定
set fileencodings=iso-2022.jp,cp932,sjis,euc-jp,utf-8


""" End Neobundle Setting.
call neobundle#end()

" 色付け
syntax enable
" Required:
filetype plugin indent on
NeoBundleCheck

if !has('vim_starting')
	" .vimrcを読み込み直した時のための設定
	call neobundle#call_hook('on_source')
endif
