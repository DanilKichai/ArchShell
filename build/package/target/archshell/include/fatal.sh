#!/usr/bin/env bash

restart () {
    if mountpoint /run; then
        systemctl reboot
    else
        reboot --force
    fi

    sleep infinity
    exit 1
}

fatal () {
    local MESSAGE="$1"
    local DELAY="30"

    echo "$MESSAGE" 1>&2
    echo "The system will be rebooted in ${DELAY} seconds. Press enter to skip..."

    timeout "${DELAY}" bash -c "read" && \
        sleep infinity

    restart
}
