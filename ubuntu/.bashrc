# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias open='evince'
alias pathmeso="cd /data/workspace/Stokes/CellInTube/vesicle/Misbah2014_3/mesocentre"
alias mkday='mkdir $(date +%Y%m%d)'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

alias vi=vim
alias lh='ll -h'
alias grep='grep -n --color=auto'
alias rm=saferm.sh
#alias myrsync='rsync --ignore-existing -raz --progress --delete'
alias myrsync='rsync -ravh'

ulimit -S -s unlimited

unset PATH
export PATH=/home/jinming/bin:/home/jinming/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin


#jdk and eclipse
export JAVA_HOME=/opt/java/jdk1.8.0_181
export PATH=/opt/java/jdk1.8.0_181/bin:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
#export PATH=$JAVA_HOME/bin:$PATH
#export JAVA_HOME=/opt/java/jdk-11.0.1
#export PATH=$JAVA_HOME/bin:$PATH
export PATH=/opt/eclipse:$PATH
#export PATH=/opt/ParaView-5.3.0-Qt5-OpenGL2-MPI-Linux-64bit/bin:$PATH
export PATH=$PATH:/opt/ParaView-5.6.1-MPI-Linux-64bit/bin

#texlive 2016
unset INFOPATH
export INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH
unset MANPATH
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH


unset LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib/openmpi/lib
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH

#export LD_PRELOAD=libmkl_intel_lp64.so:libmkl_intel_thread.so:libmkl_core.so:libiomp5.so

alias g++='g++ -std=c++11'
alias of1912='source /data/code/OpenFOAM/OpenFOAM-v1912/etc/bashrc '

export PATH=/home/jinming/bin/scripts:$PATH
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH
export SOFT2D_HOME='/home/jinming/simuCodes/Stokes/Soft2D'

export LC_ALL="en_US.UTF-8"

export PYTHONPATH=/home/jinming/softs/gimli/gimli/python
export PATH=/home/jinming/softs/gimli/gimli/python/apps:$PATH

export PATH=/home/jinming/simuCodes/Stokes/soft_cmd:$PATH
export PATH=/home/jinming/softs/vtk2gmsh/scripts:$PATH
#export PATH=/opt/intel/compilers_and_libraries_2019.0.117/linux/bin/intel64:$PATH
#export MKLROOT=/opt/intel/compilers_and_libraries_2019.0.117/linux/mkl
#export LD_LIBRARY_PATH=/opt/intel/compilers_and_libraries_2019.0.117/linux/compiler/lib/intel64:/opt/intel/compilers_and_libraries_2019.0.117/linux/mkl/lib/intel64:$LD_LIBRARY_PATH

export PATH=/opt/Zotero_linux-x86_64:$PATH
export PATH=/home/jinming/simuCodes/Stokes/SoftAxi/bin:$PATH

#export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/opt/PARDISO:/opt/coinhsl/lib:/opt/coinIpopt/lib:$LD_LIBRARY_PATH
#export PARDISO_LIC_PATH=/opt/PARDISO

export LD_LIBRARY_PATH=/opt/gismo/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/OpenMesh/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/data/code/softpp/install/lib:$LD_LIBRARY_PATH
#export PATH=/opt/gmsh/bin:$PATH
export PATH=/home/jinming/softs/boost_1_73_0:$PATH
export LD_LIBRARY_PATH=/opt/finufft/lib:/opt/fftw_3_3_8/lib:/home/jinming/softs/boost_1_73_0/stage/lib:$LD_LIBRARY_PATH
export PATH=/home/jinming/softs/Sourcetrail-2020.2.43/build/Release/app:$PATH
#export LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
#export PATH=/opt/openmpi/bin:$PATH

# set OpenMP variable
# used both for pardiso https://www.pardiso-project.org/ and 
# openblas https://github.com/xianyi/OpenBLAS
export OMP_NUM_THREADS=8

export CMAKE_ROOT=/home/jinming/.local/share/cmake-3.18

alias forti='/home/jinming/softs/forticlientsslvpn/fortisslvpn.sh & '

export LIBMESH_DIR=/data/code/libmesh_install
#export LIBMESH_DIR=/data/code/libmesh_install/opt
export PATH=$LIBMESH_DIR/bin:$PATH
export LD_LIBRARY_PATH=$LIBMESH_DIR/lib:$LD_LIBRARY_PATH

# petsc
export PETSC_DIR=/data/code/petsc_install
#export PETSC_DIR=/data/code/petsc_install/opt
#export PETSC_ARCH=arch-linux-c-opt

export LIBMESH_EX=/data/code/libmesh/examples/soif/

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
