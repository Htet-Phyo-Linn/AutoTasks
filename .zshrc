# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=( 
	git
	sudo
	copyfile
	jsontools
	dirhistory
	copybuffer
	web-search
	zsh-autosuggestions
	zsh-syntax-highlighting
	command-not-found
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



#system
alias -g s="sudo"
alias -g c="cat"
alias -g nv="nvim"
alias -g python="python3"
alias -g ins="sudo apt install"
alias -g upt="sudo apt-get update"
alias -g upg="sudo apt-get upgrade"
alias -g upf="sudo apt-get full-upgrade"
alias -g upd="sudo apt-get dist-upgrade"
alias -g fix="sudo apt --fix-broken install"
alias -g cls="sudo apt autoremove && sudo apt autoclean"
alias -g z="sudo vi ~/.zshrc"
alias -g so="sudo source ~/.zshrc"
alias -g search="sudo apt search"

alias -g ch="chmod +x"
alias -g rdir="sudo rm -rf"

alias -g dp="sudo dpkg -i"


#file path
alias -g note="cd /home/$USER/AutoTasks/note"

#autoTask
alias -g ram="sudo sh /home/$USER/AutoTasks/zsh/clearRAM.sh"
alias -g shut="cd /home/guardiau-devil/AutoTasks/tools; ./backup.sh;sudo shutdown now"
#network
alias -g dns="sudo python3 /home/$USER/AutoTasks/zsh/DNS.py"
alias -g myip="python /home/$USER/AutoTasks/zsh/ipinfo.py"

#alias -g pro="sudo mv ~/proxy.conf /etc/apt/apt.conf.d/"
#alias -g prod="sudo mv /etc/apt/apt.conf.d/proxy.conf -t ~/"


alias -g pp="nv /home/$USER/AutoTasks/tools/proxy-setup.sh"
alias -g pro="sh /home/$USER/AutoTasks/tools/proxy-setup.sh"
alias -g prod="sh /home/$USER/AutoTasks/tools/reset-proxy.sh"

alias -g flatten="sh /home/$USER/AutoTasks/zsh/flatten.sh"
alias -g filecount="sh /home/$USER/AutoTasks/zsh/filecount.sh"
#root user app
alias -g xampp="cd /opt/lampp; sudo ./manager-linux-x64.run; cd ~/"
alias -g eclipse="cd /home/$USER/App/eclipse/; ./eclipse; cd ~/"
alias -g joplin="cd /home/$USER/App/; ./Joplin-2.12.18.AppImage; cd ~/"
alias -g bitwarden="cd /home/$USER/App/; ./Bitwarden-2024.7.0-x86_64.AppImage; cd ~/"


#tools
alias -g re="python /home/$USER/AutoTasks/tools/repeater.py"

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
GOOGLE_API_KEY="AIzaSyCvDh075C62FWkQvmLyrultV0msRMAefAA"



