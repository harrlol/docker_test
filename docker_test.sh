#!/bin/bash
set -u

# Harry Li, University of Pennsylvania


usage () {
    echo ""
    echo "Usage : sh $0"
    echo ""

cat <<'EOF'
EOF
    exit 0
}

#############Grabbing arguments############
while getopts ":o:t:c:" opt; do
  case $opt in
    o)
    out=$OPTARG
     ;;
    t)
    acc=$OPTARG
     ;;
    c)
    csv=$OPTARG
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

logstart=$(date "+%Y.%m.%d-%H.%M.%S")
logfile=$out/Log_$logstart.log
exec > >(tee -a "$logfile") 2>&1
#below captures only echo...?
#exec 2>&1 1>>$logfile 3>&1

######################################################### Subprogram Definition #########################################

firstlayer () {
    echo "$out"
    echo "$acc"
    echo "$csv"
}

firstlayer