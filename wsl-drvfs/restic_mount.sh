#!/bin/bash
source ./mount_repo.sh
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/u/backups/restic/"

restic mount /mnt/restic $RESTIC_REPOSITORY
