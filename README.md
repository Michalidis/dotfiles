Before performing git actions, call

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

Then instead of calling "git add" and other git commands, call "config add". That should do the trick
