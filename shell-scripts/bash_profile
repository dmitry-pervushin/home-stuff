# export CVSROOT=:pserver:dimka@pervushin.msk.ru:/home/cvsroot/
alias grep="grep -nH --colour"

complete -cf sudo

export PATH=$HOME/bin:$PATH:/sbin:/usr/sbin:/usr/java/jdk1.5.0_20/bin

if [ ! -z $TERM -a ! $TERM = "dumb" ]; then
	. prj setup	

	# do customization depending on host name
	ME=`hostname --fqdn`
	echo -n "## Configuring for $ME..."
	if [ -f ~/hosts/$ME ]; then
		echo "OK"
		. ~/hosts/$ME
	else
		echo "using defaults, done"
	fi
fi

alias hd='od -Ax -tx1z -v'
alias please='sudo'

export GIT_AUTHOR_NAME="dmitry pervushin"
export GIT_AUTHOR_EMAIL="dmitry_pervushin@mentor.com"
export GIT_COMMITTER_NAME="dmitry pervushin"
export GIT_COMMITTER_EMAIL="dmitry_pervushin@mentor.com"

export PS1='\[\033[1;32m\](\h)\[\033[1;36m\]:\[\033[1;31m\]\w\[\033[0m\] \$ '

