#!/bin/bash

#Input valid drive letter destinations.
echo "Which drive should the backup occur on [u/e]?"
read drive

#If trimmed length of input is 0, exit.
if [ $(echo ${#drive}) == 0 ]
then
    return 2>/dev/null
    exit
fi

#If input is not a valid mounted drive letter, exit.
if [ $drive != 'u' ] && [ $drive != 'e' ]
then
    return 2>/dev/null
    exit
fi

#If drive is not local, mount the drive.
if [ $drive == 'u' ]
then
    source ./mount_repo.sh
fi

#Core restic commands
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/$drive/backups/restic/"

restic init
restic backup --exclude-file=/home/dgrewal/bin/restic/excludes.txt /mnt/c/Users/dgrewal
restic check
restic snapshots

#Display disk usage for the restic repo.
du -sh $RESTIC_REPOSITORY

#Provide the option to remove any existing snapshots after backup is complete.
echo "Would you like to remove any existing snapshots [y/N]?"
read deleteYN

#If trimmed length of input is 0, exit.
if [ $(echo ${#deleteYN}) == 0 ]
then
    return 2>/dev/null
    exit
fi

#If input is affirming a snapshot deletion, delete the snapshot.
if [ $deleteYN == 'y' ] || [ $deleteYN == 'Y' ]
then
    echo "Please indicate the ID for the snapshot which is to be removed."
    read snapshot
    restic forget $snapshot
    restic prune
    restic snapshots
    du -sh $RESTIC_REPOSITORY
fi
