#!/bin/bash
export RESTIC_PASSWORD=$(cat ~/bin/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/v/Backups/WS7928/restic_backup/"
#restic init
restic backup --exclude /mnt/e/dgrewal/OneDrive /mnt/e/dgrewal
restic check
restic snapshots
du -sh $RESTIC_REPOSITORY
