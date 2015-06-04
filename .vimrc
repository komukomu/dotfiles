"--------------------------
" vimrc
"--------------------------
" Start Neobundle Setting.
"--------------------------
"
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " bundleで管理するディレクトリを指定
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle.vim自身をneobundle.vimで管理する
NeoBundleFetch 'Shougo/neobundle.vim'
" NERDTree設定
NeoBundle 'scrooloose/nerdtree'
" 自動的にとじ括弧挿入
NeoBundle 'Townk/vim-autoclose'
" シンタックスチェック
NeoBundle 'scrooloose/syntastic'

" NNOREMAP
nnoremap <silent><C-e> :NERDTreeToggle<CR> "NERDTreeショートカット
nnoremap <C-n> gt       "タブ間の移動
nnoremap <C-p> gT       "タブを閉じる
nnoremap <C-c> closetab "タブを閉じる

"---------------------------
" 環境設定関連
"---------------------------

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
set whichwrap=b,s,[,],,~
" マウス機能有効化
set mouse=a
" カーソルラインの強調表示
set cursorline
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" 検索キーワードをハイライトしない
set nohlsearch
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" シフト移動幅
set shiftwidth=4
" ファイル内の<Tab>が対応する空白の数
set smarttab
" 括弧の対応をハイライト
set showmatch

"---文字設定関連---
" ヘルプの日本語化プラグインの設定
set helplang=ja,en
" 標準コード設定(UTF-8)
set encoding=utf-8
" 文字自動判別設定
set fileencodings=iso-2022.jp,cp932,sjis,euc-jp,utf-8 

call neobundle#end()

"------------------------
" End Neobundle Setting.
"------------------------

filetype plugin indent on " Required
:
syntax enable	          " 色付け

" 未インストールのプラグインがある時に、尋ねてくる
NeoBundleCheck

if !has('vim_starting')
	" .vimrcを読み込み直した時のための設定
	call neobundle#call_hook('on_source')
endif
