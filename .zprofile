#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------
# Color
RED="%F{red}"
YELLOW="%F{yellow}"
GREEN="%F{green}"
NO_COLOUR="%F{white}"
NEWLINE=$'\n'
#   Change Prompt
#   ------------------------------------------------------------
    #export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\] at \[\e[0;34m\]\W\[\e[0m\] -> '
    #export PS1='\[\033[0;32m\] ➤ \[\033[00m\] \[\e[0;34m\]\W\[\033[0;32m\] $(_git_prompt) \[\033[00m\]'

#   Set Paths
#   ------------------------------------------------------------
JAVA_8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/"
JAVA_11_HOME="/Library/Java/JavaVirtualMachines/jdk-14.0.1.jdk/Contents/Home/"
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export JAVA_HOME="$JAVA_8_HOME"
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PATH

#export PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{$%f%}%% "
#export PROMPT_COMMAND=''
# NVM
export NVM_DIR="$HOME/.nvm" 
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k
#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
alias json='python -m json.tool'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls -G; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='vim'                        # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
#   ---------------------------
#   5.  NETWORKING
#   ---------------------------

alias myip='curl -s http://whatismyip.akamai.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
#   ---------------------------------------
#   6.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------
alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
#aliases and functions
# Some directory listing with colors
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

# Usefull stuff for presentation and seeing dotfiles
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias showall='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

# Get rid of those pesky .DS_Store files recursively
alias dsclean='find . -type f -name .DS_Store -print0 | xargs -0 rm'

# Flush your dns cache
alias flush='dscacheutil -flushcache'

function server() {
  local port="${1:-8000}"
  open -a google\ chrome  "http://localhost:${port}/" --args --disable-web-security
  
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function download() {
  mkdir -p $2
  curl "$1" --output $2'/'$3
}
#   ---------------------------
#   GIT
#   ---------------------------
GIT_PROMPT_THEME_FILE=Single_line_Dark
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

#   ---------------------------
#   Wanderer
#   ---------------------------
export WANDERER_HOME="~/WorkSpace/Wanderer"
alias wanderer="cd $WANDERER_HOME"
alias relogin=". ~/.bash_profile"
alias bash='relogin'
alias rs='reset'
alias build='mvn clean test install -DfailIfNoTests=false'
alias buildNoTest="mvn clean install -DskipTests"
alias buildDocker="mvn docker:build"
function createProject() {
  mvn archetype:generate -B -DarchetypeGroupId=com.infamous.rtz \
                            -DarchetypeArtifactId=rtz-maven-app \
                            -DarchetypeVersion=1.0.0 \
                            -DgroupId=$1 \
                            -DartifactId=$2 \
                            -Dversion=$3
}
#   ---------------------------
#   Docker
#   ---------------------------
function accessDockerContainer() {
  docker exec -it $1 bash
}

function buildImageCommand() {
  cd $1
  buildDocker
  cd $WANDERER_HOME
}

PATH="~/WorkSpace/Wanderer/scripts:${PATH}"
export PATH

function generatePassword() {
  if [ $1 ] ; then
     openssl rand -base64 $1
  else 
     openssl rand -base64 8
  fi
}

function decodeBase64() {
  echo "$1" | base64 --decode ; echo
}

export WORKSPACE="~/WorkSpace"
export FLASH_CARD_DIR="/Users/apple/WorkSpace/computer-science-flash-cards"

function flashCard() {
  python $FLASH_CARD_DIR/flash_cards.py
}

function jshell() {
    $JAVA_11_HOME/bin/jshell
}

export _PS1="$YELLOW$USER$NO_COLOUR:$GREEN%~ $NO_COLOUR"
export PS1="${_PS1} ${NEWLINE} ➤ "
