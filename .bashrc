#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias 6.823="ssh -Y vlsifarm-03.mit.edu"
alias stickmen="ssh stickmen-media.mit.edu"
PS1='[\u@\h \W]\$ '

source ./.machineSpecific.sh
