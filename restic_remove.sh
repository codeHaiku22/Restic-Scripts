#!/bin/bash
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/d/backups/restic_backup/"
restic snapshots
du -sh $RESTIC_REPOSITORY
echo "Please indicate the ID for the snapshot which is to be removed."
read snapshot
restic forget $snapshot
restic prune
restic snapshots
du -sh $RESTIC_REPOSITORY
