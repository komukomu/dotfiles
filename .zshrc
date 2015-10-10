# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a radom theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="fishy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github osx brew brew-cask)

source $ZSH/oh-my-zsh.sh

# ---------------------------------
# Prompt
# ---------------------------------

# プロンプトに色をつける
#autoload -U colors; colors

### 一般ユーザ時 ###
#tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
#tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
#tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
#tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
#if [ ${UID} -eq 0 ]; then
#    tmp_prompt="%B%U${tmp_prompt}%u%b"
#    tmp_prompt2="%B%U${tmp_prompt2}%u%b"
#    tmp_rprompt="%B%U${tmp_rprompt}%u%b"
#    tmp_sprompt="%B%U${tmp_sprompt}%u%b"
#fi

#PROMPT=$tmp_prompt    # 通常のプロンプト
#PROMPT2=$tmp_prompt2  # コマンドが2行以上の時に表示される)
#RPROMPT=$tmp_rprompt  # 右側のプロンプト
#SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト


# ---------------------------------
# History
# ---------------------------------

# ヒストリを保存するファイル
#HISTFILE=~/.dots/zsh/.zsh_history
HISTFILE=~/.zsh_history
autoload -U compinit
compinit -d ~/.zcompdump
#compinit -d ~/.dots/zsh/.zcompdump

# 保存されるヒストリのメモリ制限
HISTSIZE=1000000

# 保存されるヒストリの件数
SAVEHIST=$HISTSIZE

# 余分なスペースを削除し保存する
setopt hist_reduce_blanks

# 同じコマンドはヒストリに追加しない
setopt hist_ignore_dups

# 同時起動時のシェルヒストリを共有する
setopt share_history

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

### Ls Color ####
export LSCOLORS=Exfxcxdxbxegedabagacad


# ---------------------------------
# Complete
# ---------------------------------

# 補完時の色の設定
#export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#export ZLS_COLORS=$LS_COLORS

# lsコマンド時、自動で色がつく
export CLICOLOR=true

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# --------------------------------
# Option
# ---------------------------------

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 補完候補が複数ある場合自動的に一覧表示する
setopt auto_menu

# ディレクトリ名だけで移動
setopt auto_cd

# 入力時のコマンドが異なる場合に候補を表示
setopt correct

# ビープ音停止
setopt no_beep

# 色を使う
setopt prompt_subst

# <Tab>で更に候補を選択可能
zstyle ':completion:*default' menu select=1

# ---------------------------------
# Alias
# ---------------------------------

alias rez='source .zshrc'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# global alias
alias -g G=' | grep'
alias -g L=' | less'
# ls
alias la='ls -a'		# 隠しファイル表示
alias ll='ls -l'		# 詳細一覧表示
alias lss='ls -s'		# byteでsizeを表示
# rm
alias rf='rm -f '		# file削除
alias rr='rm -rf '		# directory削除
alias rrd='rm -rf .DS_Store'	# .DS_Store削除
# vim .~
alias viz='vim .zshrc'		# .zshrc編集
alias vim.='vim .vimrc'		# .vimrc編集
# brew
alias bdoc='brew doctor'
alias bupd='brew update'
alias bupg='brew upgrade --all'


# ----------------------------------
# Keybind
# ----------------------------------

# ^Rで履歴検索実行時にワイルドカードを使用可能にする
bindkey '^R' history-incremental-pattern-search-backward


# ----------------------------------
# Other
# ----------------------------------

# 補完候補のメニュー選択で矢印キーの変わりにhjklで移動可能にする
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
