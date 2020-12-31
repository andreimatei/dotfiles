#! /bin/sh

if [ $# -eq 0 ]
then
  echo "Usage: findwindow.sh <process name> [<index>]"
  exit 1
fi

if [ -z $2 ]
then
  idx=1
else
  idx=$2
fi

wmctrl -l -p | awk -v name=$1 -v idx=$idx '
{
  if (system("grep -q "name" /proc/"$3"/cmdline") == 0) {
    i=i+1
    if (i==idx) {
      winID = $1
      exit
    }
  }
}
END {
  if (winID == "") {
    print "not found"
    exit 1
  } else {
  print "focusing on window" winID}
  exit system("wmctrl -i -a "winID)
}'
