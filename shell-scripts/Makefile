Q=@
LINUX_SRC=/usr/src/linux
DONTDIFF=/usr/src/linux/Documentation/dontdiff

install:
	${Q}install -m 0755 bash_profile ~/.bash_profile
	${Q}install -d ~/bin
	${Q}install -m 0755 prj ~/bin/prj
	${Q}install -m 0755 bin/* ~/bin
	${Q}install -d ~/defaults
	${Q}install -m 0755 project-vars ~/defaults/project-vars
	${Q}touch ~/defaults/dontdiff
	${Q}([ -f ${DONTDIFF} ] && cp ${DONTDIFF} ~/defaults)

	${Q}install -m 0755 shoeleather ~/bin/shoeleather
	@echo Installed to ${HOME}
	@echo You might need to logoff/logon to activate changes from .bash_profile

push:
	git push ssh+git://dimka@brainbox:443/opt/git/shell-scripts.git master

