#!/bin/bash
source ./mount_repo.sh
export RESTIC_PASSWORD=$(cat  /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/u/backups/restic/"
restore_point="/mnt/c/Users/dgrewal/Restores"
du -sh $RESTIC_REPOSITORY
restic snapshots
echo "Please indicate the ID of the snapshot which is to be restored to "$restore_point.
read snapshot
restic restore -v $snapshot --target /mnt/d/restores
