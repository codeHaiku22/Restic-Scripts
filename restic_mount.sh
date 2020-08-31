#!/bin/bash
export RESTIC_PASSWORD=$(cat /home/dgrewal/bin/restic/.restic_pwd)
export RESTIC_REPOSITORY="/mnt/d/backups/restic_backup/"

restic mount /mnt/restic $RESTIC_REPOSITORY
