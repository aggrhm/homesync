alias ls="ls -G"
alias v="mvim"
alias rm="rm -i"
alias cp="cp -i"

gl='/Users/alan/Projects/web/grouplink'
pp='/Users/alan/Projects/web/patentpro'
qs='/Users/alan/Projects/web/qstudios'

# add ~/bin to path
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# add /usr/local/bin to path
PATH="$PATH:/usr/local/bin:~/Projects/tools/android-sdk-mac_86/tools"
[[ -s "/Users/alan/.rvm/scripts/rvm" ]] && source "/Users/alan/.rvm/scripts/rvm"

source ~/.myprompt
qsprompt
