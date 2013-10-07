#!/bin/bash

usage()
{
cat << EOF
usage: $0 -s SOURCE_FOLDER -t TARGET_FOLDER -u URL/HOST

OPTIONS:
    -h      Shows this message
    -s      SOURCE_FOLDER on local machine
    -t      TARGET_FOLDER on remote machine
    -u      URL to remote machine (domain.tld)
    -d      Debug mode ON or OFF
EOF
}

##########################################
# Entry point for script
##########################################
TARGET=
SOURCE=
HOST=
DEBUG=

# Some basics at the follwing page
# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
while getopts “hu:t:s:d:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         t)
             TARGET=$OPTARG
             ;;
         s)
             SOURCE=$OPTARG
             ;;
         u)
             HOST=$OPTARG
             ;;
         d)
             DEBUG=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [[ -z $TARGET ]] || [[ -z $SOURCE ]] || [[ -z $HOST ]]
then
     usage
     exit 1
fi

# GET CURRENT DATE AS STRING
NOW=$(date +"%Y%m%d_%H%M%S")

if [[ $DEBUG == "ON" ]]; then
    echo "DEBUG: $NOW"
fi

echo "Creating directory on remote server."
/usr/bin/ssh $HOST mkdir -p $TARGET
echo "Directory created on remote server."
echo "Starting rsync."
/usr/bin/rsync -avz -e ssh --delete $SOURCE $HOST:$TARGET
echo "Rsync finished."

exit 0
