#!/bin/bash
export RESTIC_PASSWORD=$(cat  /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/d/backups/restic_backup/"
restore_point="/mnt/v/Restores"
du -sh $RESTIC_REPOSITORY
restic snapshots
echo "Please indicate the ID of the snapshot which is to be restored to "$restore_point.
read snapshot
restic restore -v $snapshot --target /mnt/d/restores
