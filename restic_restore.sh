#!/bin/bash
export RESTIC_PASSWORD=$(cat ~/bin/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/v/Backups/WS7928/restic_backup/"
#restic init
du -sh $RESTIC_REPOSITORY
restic snapshots
echo "Please indicate the ID of the snapshot which is to be restored to /mnt/v/Restores."
read snapshot
restic restore $snapshot --target /mnt/v/Restores
