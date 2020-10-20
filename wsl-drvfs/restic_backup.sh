#!/bin/bash
source ./mount_repo.sh
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/u/backups/restic/"
restic init
restic backup --exclude-file=/home/dgrewal/bin/restic/excludes.txt /mnt/c/Users/dgrewal
restic check
restic snapshots
du -sh $RESTIC_REPOSITORY
