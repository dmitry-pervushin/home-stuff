#!/bin/sh

function wrap_piece() {
	echo "cat | $1 << $2"
	cat  "$3"
	echo -e "\n$2"
}

function help() {
	echo "Error: $2"
	echo "Usage: $1 output_file license_text file...."
	echo "Happy scripting!"
}

O=$1; shift
LICENSE=$1; shift
FILES=$*
OPTIONS=z
TARBALL=/tmp/$$_archive

if [ -z $LICENSE ]; then  help $0 "Missing LICENSE" && exit 1;fi
if [ ! -f $LICENSE ]; then  help $0 "Missing LICENSE file ($LICENSE)" && exit 11;fi
if [ ! -e $FILES ]; then help $0 "What were you going to pack?" && exit 2; fi
if [ -z $O ]; then help $0 "No destination file" && exit 3; fi
if [ -f $O ]; then help $0 "Destination file exists, won't overwrite it" && exit 4; fi

echo "License file = $LICENSE"
echo "tarball      = $FILES"
echo "output file  = $O"

tar ${OPTIONS}cf $TARBALL $FILES
echo "#!/bin/sh" 					>> $O
echo "echo 'Press ENTER to view the license' && read null" >> $O
wrap_piece "less -r" LICENSE_EOF $LICENSE 			>> $O
echo "echo -n 'Type I ACCEPT if you agree to the terms of the license:'" >> $O
echo "read ANSWER" 					>> $O
echo '[ x"$ANSWER" == x"I ACCEPT" ] || exit 0'		>> $O
lines=`cat $O | wc -l`
echo "tail -n +`expr $lines + 3` \$0 | tar vx$OPTIONS"	>> $O
echo "exit"						>> $O
cat $TARBALL						>> $O
echo "--------------- 8< --- cut here ---------- "
md5sum $O
echo "File size = `ls -s --block-size=1 $O`"
echo "--------------- 8< --- ..to here --------- "
