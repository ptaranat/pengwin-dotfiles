# GPG
export GPG_TTY=$(tty)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$HOME/.cache/p10k-instant-prompt-panat.zsh" ]]; then
	source "$HOME/.cache/p10k-instant-prompt-panat.zsh"
fi

source ~/.zsh_plugins/zsh-snap/znap.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

znap clone \
	git@github.com:zsh-users/zsh-autosuggestions.git \
	git@github.com:zsh-users/zsh-completions.git \
	git@github.com:zsh-users/zsh-syntax-highlighting.git \
	git@github.com:zsh-users/zsh-history-substring-search.git \
	git@github.com:ohmyzsh/ohmyzsh.git \
	git@github.com:romkatv/powerlevel10k.git \
	git@github.com:djui/alias-tips

znap prompt powerlevel10k

# From OMZ
znap source ohmyzsh
znap source ohmyzsh \
	plugins/{git,debian,autojump,colored-man-pagesgpg-agent} \
	plugins/{python,pip} \
	plugins/{node,npm,yarn} \
	plugins/golang \
	plugins/{rust,cargo} \
	plugins/{aws,docker,terraform}

znap source alias-tips

# Zsh-users
znap source zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-syntax-highlighting
znap source zsh-history-substring-search
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-autosuggestions

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='micro'
fi

# Keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# GO
export PATH=$PATH:$(go env GOPATH)bin

# Scroll in less
export LESS='--mouse --wheel-lines=3'

# Bat theme
export BAT_THEME=base16

# EC535
export EC535="/c/Users/Panat/Documents/GitHub/taec535"

# Navi Widget (Ctrl+G)
eval "$(navi widget zsh)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias reload="exec zsh"
alias e=$EDITOR
alias c="clear"
alias python="python3"
alias ls="exa"
#alias tree="exa --tree"
alias zshconf="micro ~/.zshrc"
alias ohmyzsh="micro ~/.oh-my-zsh"
alias weather="curl wttr.in"
alias bat="batcat"
alias fd="fdfind"
alias rg="rgrep"
alias disks='echo "╓───── m o u n t . p o i n t s"; \
			echo "╙────────────────────────────────────── ─ ─ "; \
			lsblk -a; echo ""; \
			echo "╓───── d i s k . u s a g e";\
			echo "╙────────────────────────────────────── ─ ─ "; \
			df -h;'
alias fixdos="find . -type f -print0 | xargs -0 dos2unix"
alias memo="bat -p ~/memo.md"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
