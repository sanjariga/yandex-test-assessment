#!/bin/bash

set -x

PATH_TO_DIR=${1}
NUMBER_OF_DAYS=${2}

help(){
    echo "This script performs cleanup of log files in requested folder that are older than requested amount of days"
    echo "Example:"
    echo "bash ./clean_old_logs.sh '/var/log/' 10"
    exit 1
}

perform_search(){
    sudo find "${PATH_TO_DIR}" -type f -iname "*.log" -mtime +"${NUMBER_OF_DAYS}" -print
}

perform_cleanup(){
    sudo find "${PATH_TO_DIR}" -type f -iname "*.log" -mtime +"${NUMBER_OF_DAYS}" -ok rm {} \;
}

if [ -z "${PATH_TO_DIR}" ] || [ -z "${NUMBER_OF_DAYS}"]; then
    help
fi

if ! [[ "${NUMBER_OF_DAYS}" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Number of days must be a positive integer"
    help
fi

perform_search
perform_cleanup
