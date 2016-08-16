source ~/.git-completion.bash
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

# added by Anaconda 2.0.0 installer
export PATH="${HOME}/anaconda2/bin:$PATH"

export EDITOR='vim'

# CDPATH !http://linux.101hacks.com/cd-command/cdpath/
if test “${PS1+set}”; then CDPATH=$HOME/workspace; fi

