# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=7500
HISTFILESIZE=7500

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u\e[0m\[\033[1;32m\]@\h\[\033[0;36m\]\w\n\[\033[00m\]\j) Yes? '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u\e[0m\[\033[1;32m\]@\h\[\033[0;36m\]\w\n\[\033[00m\]\j\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@ \w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

########## ALIASES ##########

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
alias la='ls -hA --group-directories-first'
alias ll='ls -hl'
alias lla='ls -hoA --group-directories-first'
alias lo='ls -hon --group-directories-first'
alias lt='ls -tnhro'
alias lz='ls -lSornh'

alias h='history'

alias vi='vim'

#apt-get
alias update='sudo apt-get update && sudo apt-get upgrade'
alias clean='sudo apt-get clean && sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get check'

#calculator
alias calc='bc -l'

#become root
alias root='sudo /bin/bash'

#python
alias p2='python2.7'
alias p3='python3.2'

#alias for system info
alias sys='inxi -v7'

#alias for locate to ignore case
alias locate='locate -i'

#alias for weather
alias weather='curl wttr.in/seattle'

# for sshing
alias thrasymachus='ssh -t $THRASYMACHUS bash'
#alias thrasymachus='ssh -i /home/mpurcell/.ssh/id_rsa_thr 128.95.168.151'
alias thrasymachusx='ssh -X -C -c blowfish-cbc,arcfour $THRASYMACHUS'
#alias thrasymachusx='ssh -X -C -c blowfish-cbc,arcfour 128.95.168.151'
alias polemarchus='ssh -t $POLEMARCHUS_HOME bash'
alias callicles='ssh -t $CALLICLES_HOME bash'
alias uw='ssh -t mpurcell@ovid.u.washington.edu bash && cd'
alias ip='wget http://ipinfo.io/ip -qO -'

# use mosh to read mutt on thrasymachus; this can handle computer sleep and unstable wifi
alias moshmutt='mosh --ssh="/usr/bin/ssh -i ~/.ssh/id_rsa_thr -t" $THRASYMACHUS mutt'
alias moshrainmutt='mosh --ssh="/usr/bin/ssh -i ~/.ssh/id_rsa_thr -t" -- $THRASYMACHUS mutt -F ~/.mutt/rainmuttrc'

#An alias for raindog email
alias rainmutt='mutt -F ~/.mutt/rainmuttrc'

#Aliases for todo lists
alias t='todo'
alias td='todone'
alias tda='todone-archive'

#restart and shutdown
alias restart='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown now'

# Some more aliases to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias rcp='rsync -vv --ignore-existing'
alias mv='mv -i'

#Human readable disk usage
alias du='du -hs'

#Set Keyboard to Dvorak
alias dvorak='setxkbmap dvorak && capslock'
#Set Keyboard to qwerty
alias qwerty='setxkbmap us'
#Set Keyboard to colemak
alias colemak='setxkbmap us -variant colemak && xmodmap -e "keycode 9 = Caps_Lock" && xmodmap -e "keycode 66 = Escape"'

#Check the syntax for awesome wm's config file
alias ak='awesome -k'

#Edit awesome's config file
alias awconf='vi ~/.config/awesome/rc.lua'

#When conky has a black screen, start compositor
alias comp='cb-compositor --start'

#slow down logitech mouse
#the device, 9, may be different. 
#Enter 'xinput' in terminal to find its value
alias mouse='xinput --set-prop "12" "Device Accel Constant Deceleration" 2'

#change terminal theme
alias brown_dark='cp ~/.config/Terminal/sweet_love_terminalrc ~/.config/Terminal/terminalrc'
alias brown_light='cp ~/.config/Terminal/dwmrob_terminalrc ~/.config/Terminal/terminalrc'
alias default_theme='cp ~/.config/Terminal/pastely_dark_terminalrc ~/.config/Terminal/terminalrc'
alias newsbeuter_theme='cp ~/.config/Terminal/newsbeuter_terminalrc ~/.config/Terminal/terminalrc'
alias solarized_pure='cp ~/.config/Terminal/pure_solarized_terminalrc ~/.config/Terminal/terminalrc'
alias solarizedesque='cp ~/.config/Terminal/solarizedesque_terminalrc ~/.config/Terminal/terminalrc'
alias zenburn='cp ~/.config/Terminal/zenburn_terminalrc ~/.config/Terminal/terminalrc'

#touchpad check
alias syn='synclient | grep -i remotionminz && synclient | grep -i remotionmaxz && synclient | grep -i hyst && synclient | grep -i fingerlow && synclient | grep -i fingerhig && synclient | grep -i tapbutton1 && synclient | grep -i tapbutton2 && synclient | grep -i palm'

#Change Time Zones
alias timezone='sudo dpkg-reconfigure tzdata'

# Swap caps lock and esc
alias capslock='xmodmap ~/.swap_capslock_esc'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

########## VARIABLES ########## 

# set some variables--list these with 'env' in terminal
export PATH=/home/mpurcell/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/mpurcell/bin/desktops/
export a=/home/mpurcell/.config/awesome
export h=/home/hobbes
export l=/home/mpurcell/Sync/linux
export p=/home/mpurcell/Sync/publish
export py=/home/mpurcell/Sync/linux/python
export p3=/home/mpurcell/Sync/linux/python/python3/
export tch=/home/mpurcell/Sync/uw-udp/teaching
export t=/home/mpurcell/.config/xfce4/terminal

# define default programs
export EDITOR=vi
#export TERM=xfce4-terminal

# define variables for ip addresses
export THRASYMACHUS="128.95.140.95"
export POLEMARCHUS_HOME="10.0.0.2"
export CALLICLES_HOME="10.0.0.22"
export UW="mpurcell@ovid.u.washington.edu"

#Fix gnome keyring message in bash
#unset GNOME_KEYRING_CONTROL

#====================GREETING====================

echo -e "\nHello, $USER. Welcome to $HOSTNAME."
#curl -s wttr.in/seattle | sed -n '3,7p'
echo -e "It is $(date +%l:%M%P\ on\ %A,\ %B\ %e).
Don't worry, $USER, everything is going to be fine.
"
### EOF ###
