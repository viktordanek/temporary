#!/bin/sh

${ECHO} "${NICE} --adjustment 19 $( ${DIRNAME} ${0} )/teardown-synch" PIPE ${AT} now TO /dev/null > /dev/stderr