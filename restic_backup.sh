#!/bin/bash
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/d/backups/restic_backup/"
#restic init
restic backup --exclude-file=/home/dgrewal/bin/restic/excludes.txt /mnt/c/Users/dgrewal
restic check
restic snapshots
du -sh $RESTIC_REPOSITORY
