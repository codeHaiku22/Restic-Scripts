#!/bin/bash
export RESTIC_PASSWORD=$(cat ~/bin/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/v/Backups/WS7928/restic_backup/"
restic snapshots
du -sh $RESTIC_REPOSITORY
echo "Please indicate the ID for the snapshot which is to be removed."
read snapshot
restic forget $snapshot
restic prune
restic snapshots
du -sh $RESTIC_REPOSITORY
