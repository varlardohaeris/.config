# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install


export PATH=/home/been/.local/bin:$PATH

export GOPATH=$HOME/go
export GOROOT=$HOME/tools/go
export GOPROXY=https://mirrors.aliyun.com/goproxy/
export PATH=$GOROOT/bin:$PATH

export PATH=/Users/been/tools/go/bin:$PATH
export M2_HOME=/Users/been/tools/apache-maven-3.6.1
export PATH=$M2_HOME/bin:$PATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-12.jdk/Contents/Home
# export JAVA_HOME=/Users/been/tools/jdk-12.0.2.jdk/Contents/Home
# export JAVA_HOME=/Users/been/tools/zulu14.28.21-ca-jdk14.0.1-macosx_x64
# export JAVA_HOME=/Users/been/tools/jdk-14.0.1.jdk/Contents/Home
export JAVA_HOME=/Users/been/tools/jdk-15.jdk/Contents/Home
# export JAVA_HOME=/Users/been/tools/labsjdk-ce-11.0.7-jvmci-20.1-b02/Contents/Home
# export JAVA_HOME=/Users/been/tools/zulu11.33.15-ca-jdk11.0.4-macosx_x64
# export JAVA_HOME=/Users/been/tools/zulu8.40.0.25-ca-jdk8.0.222-macosx_x64
# export JAVA_HOME=/Users/been/tools/jdk1.8.0_251.jdk/Contents/Home
# export JAVA_HOME=/Users/been/tools/jdk-11.0.7.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# export PATH=/Users/been/tools/gdb-8.3/bin:$PATH
export PATH=/Users/been/tools/gradle-5.5.1/bin:$PATH
export PATH=/Users/been/tools/protof-2.5.0/bin:$PATH
#export PATH=/Users/been/tools/scala-2.12.8/bin:$PATH
export PATH=/Users/been/tools/scala-2.11.2/bin:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/openresty-openssl/bin:$PATH"


export PATH=/Users/been/repo/mx:$PATH
export SDKROOT=`xcrun --show-sdk-path`

export PATH=/Users/been/tools/nginx/sbin:$PATH

export ANT_HOME=/Users/been/tools/apache-ant-1.9.14
export PATH=$ANT_HOME/bin:$PATH

export PATH=/Users/been/tools/ag/bin:$PATH

export CLASSPATH=".:/Users/been/tools/antlr/antlr-4.8-complete.jar:$CLASSPATH"
alias antlr4='java -jar /Users/been/tools/antlr/antlr-4.8-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'


[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# opam configuration
test -r /Users/been/.opam/opam-init/init.zsh && . /Users/been/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#unset LANG

# export JAVA_TOOL_OPTIONS="-Duser.country=US"
export PATH=/Users/been/.local/bin:$PATH

export CLASSPATH="/Users/been/tools/jdk1.8.0_251.jdk/Contents/Home/lib/tools.jar:$CLASSPATH"

export PATH=/Users/been/bin:$PATH
# export PATH=/Users/been/tools/ccls/bin:$PATH

export PATH=/Users/been/Library/Python/2.7/bin:$PATH
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891

# Taichi
export TAICHI_REPO_DIR=/Users/been/repo/taichi
export PYTHONPATH=$TAICHI_REPO_DIR/python:$PYTHONPATH
export PATH=$TAICHI_REPO_DIR/bin:$PATH


alias emacs28="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacs="emacs28 &;disown;"


export PATH=/Users/been/repo/depot_tools:$PATH
