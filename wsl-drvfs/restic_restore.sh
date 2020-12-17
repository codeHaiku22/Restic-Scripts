#!/bin/bash

#Input valid drive letter destinations.
echo "Which drive should the restore occur from [u/e]?"
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

#Establish a location to restore the snapshot to.
restorePoint="/mnt/c/Users/dgrewal/Restores"

#Display disk usage for the restic repo.
du -sh $RESTIC_REPOSITORY

restic snapshots

#Request a snapshot Id to restore.
echo "Please indicate the ID of the snapshot which is to be restored to "$restorePoint.
read snapshot

#If trimmed length of input is 0, exit.
if [ $(echo ${#snapshot}) == 0 ]
then
    return 2>/dev/null
    exit
fi

restic restore -v $snapshot --target $restorePoint
