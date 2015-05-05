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

" NEOBUNDLE
" neobundle.vim自身をneobundle.vimで管理する
NeoBundleFetch 'Shougo/neobundle.vim'
" NERDTree設定
NeoBundle 'scrooloose/nerdtree'
" 自動的にとじ括弧挿入
NeoBundle 'Townk/vim-autoclose'
" シンタックスチェック
NeoBundle 'scrooloose/syntastic'
" ヘルプの日本語化プラグインのインストール指定
NeoBundle 'vim-jp/vimdoc-ja'


" NNOREMAP
nnoremap <silent><C-e> :NERDTreeToggle<CR> "NERDTreeショートカット
nnoremap <C-n> gt       "タブ間の移動
nnoremap <C-p> gT       "タブを閉じる
nnoremap <C-c> closetab "タブを閉じる


" 環境設定関連
set number         " 行番号表示
set showtabline=4  " タブを常に表示
set laststatus=2   " ステータスラインを常に表示
set helplang=ja,en " ヘルプの日本語化プラグインの設定
set encoding=utf-8 " 標準コード設定(UTF-8)
set fileencodings=iso-2022.jp,cp932,sjis,euc-jp,utf-8 " 文字自動判別設定 


call neobundle#end()

"------------------------
" End Neobundle Setting.
"------------------------

filetype plugin indent on " Required:
filetype off	          " ファイルタイプ関連無効化

syntax enable	          " 色付け

" 未インストールのプラグインがある時に、尋ねてくる
NeoBundleCheck

if !has('vim_starting')
	" .vimrcを読み込み直した時のための設定
	call neobundle#call_hook('on_source')
endif

