#!/bin/sh
# CJB - CJ's benchmark
# v1.0
# 2019/08/14

BASEDIR=$1
DATE=`date +'%Y-%m-%d'`

# I hate bash. Could have done this in like 3 lines of perl :)

LAST_LINE=`date +%Y:%m:%d,%H:%M`
HN=`hostname -f`
LAST_LINE="$HN,$LAST_LINE"

function time_since() {
	NOW=`date +%s.%N`
	TIME=$(echo "$NOW - $1" | bc)
	TIME=$(echo $TIME | sed 's/^\./0./') # Add leading zero if missing
	TIME=$(echo "${TIME:0:${#TIME}-6}")
	echo "Time taken: $TIME"
	
	LAST_LINE="$LAST_LINE,$TIME"
}

function create_files() {
  BASE=$1
  COUNT=$2
  SIZE=$3
  echo "# Creating $COUNT files of $SIZE kb each. Randomised data"
  for ((i=0; i<=COUNT; i++)); do 
    dd if=/dev/urandom bs=1024 count=$SIZE of=$BASE/cjb-$SIZE-$i >>/dev/null 2>&1; 
  done
}
  
# Sanity checks

#if [[ $EUID -eq 0 ]]; 
#then
#   echo "This script should not be run as root" 
#   exit 1
#fi

if ! [ -f /usr/bin/bc ]
then
  echo "Missing required binary /usr/bin/bc. Aborting"
  exit 1
fi

if ! [[ "$BASEDIR" ]]
then 
  echo "Must specify base directory to run benchmark"
  exit 1
elif [[ "$BASEDIR" =~ \ |\; ]]
then
  echo "Spaces or semicolons in BASEDIR. Aborting!"
  exit 1
elif ! [ -d "$BASEDIR" ]
then
  echo "Basedir of '$BASEDIR' does not exist"
  exit 1
fi

# We require 5GB free space so check for that
FREE=`df ${BASEDIR} | tail -n 1  | awk {'print \$4;'}`

if ! [ $FREE -ge "5000000" ]; 
then
  echo "Not enough free space to run tests. Aborting"
	exit 1
fi 

LAST=`date +%s.%N`
RUNDIR="$BASEDIR/cjb-v1-201908"
echo "# Clearing ${RUNDIR}/"
test -d $RUNDIR || mkdir $RUNDIR
rm -f $RUNDIR/cjb*
rm -f $RUNDIR/dir/cjb*
rmdir $RUNDIR/dir >> /dev/null 2>&1

create_files $RUNDIR 10000 10
create_files $RUNDIR 1000 500
create_files $RUNDIR 100 10000

time_since ${LAST}
LAST=`date +%s.%N`

# Should be an itterative loop :S
echo ""; echo "# Copy test (read/write)"
mkdir $RUNDIR/dir
cp $RUNDIR/cjb* $RUNDIR/dir/ -a
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# Concat test (read/write)"
cat $RUNDIR/cjb-* >> $RUNDIR/dir/cjb-big
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# Grep test (read)"
grep foo $RUNDIR -Ri >>/dev/null 2>&1
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# Cached grep test (read)"
# Should have cached entries after previous grep
grep foo $RUNDIR -Ri >>/dev/null 2>&1
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# ls test (metadata)"
ls -laStr $RUNDIR | wc -l >>/dev/null 2>&1
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# find test (metadata)"
find $RUNDIR -type f -cmin -20 | wc -l >>/dev/null 2>&1
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# delete test (metadata)"
rm -f $RUNDIR/dir/cjb*
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# rsync test (read/write)"
rsync -pogtlv $RUNDIR/cjb* $RUNDIR/dir/ >> /dev/null 2>&1
time_since ${LAST}
LAST=`date +%s.%N`

echo ""; echo "# Cleanup (metadata)"
rm -f $RUNDIR/cjb*
rm -f $RUNDIR/dir/cjb*
rmdir $RUNDIR/dir >> /dev/null 2>&1
time_since ${LAST}

echo ""; echo $LAST_LINE


