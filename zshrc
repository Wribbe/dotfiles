# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/steff/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blinks"

# Iitialize fasd.
eval "$(fasd --init auto)"
# Rebind mappings.
alias n='z'

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
 set -o vi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

alias pusho='git push origin master'

git config --global alias.c commit
git config --global alias.ch checkout
git config --global alias.br branch
git config --global alias.ss 'diff --staged'
git config --global alias.s status
git config --global alias.p 'add -p'

alias gc='git c -v'    # commit
alias gss='git ss'  # diff --staged
alias gs='git s'    # git status
alias gp='git p'    # add patch
alias octave='octave --no-gui'
alias gph='git push origin HEAD'

rip_youtube () {youtube-dl -xk --no-post-overwrites -o "%(autonumber)s-%(title)s.%(ext)s" --audio-format mp3 $1}

zathura () {
    /bin/zathura ${1} 2>/dev/null &
}

alias vim='nvim'

export SYSTEMD_EDITOR='nvim'
export EDITOR="nvim"

alias aa='setxkbmap us -variant colemak'
alias sus='sudo s2ram -f'

export PATH=~/bin:~/.cabal/bin:$PATH
export CUPS_SERVER=192.168.1.6:631

alias mm="make"
alias hib="sudo systemctl hibernate"

#. /home/steff/AUR/emsdk/src/emsdk-portable/emsdk_env.sh
PATH=$PATH:/usr/lib/emscripten
PATH=$PATH:/opt/android-sdk/tools/bin
export JAVA_OPTS="-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee"

alias tt=task
alias .=source

evince () {
  /bin/evince $1 1>&2 2>/dev/null &
}

taskarena-init() {
  [ -d ".taskarena" ] || mkdir ".taskarena"
  rm .taskarena/source_me.sh
  cp ~/taskarena/.taskarena/source_me.sh .taskarena/source_me.sh
}

PATH=~/bin:$PATH

#alias tree="tree -I 'virt_*|__pycache__|*.pyc'"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files'

tree () {
  if [ -e ".gitignore" ]; then
    /bin/tree -I $(python -c 'print("|".join([f"{l.strip()}" for l in open(".gitignore", "r").readlines()]))')
  else
    /bin/tree
  fi
}
