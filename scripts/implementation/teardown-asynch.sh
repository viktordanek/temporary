#!/bin/sh

${ECHO} ${NICE} --adjustment 19 $( ${DIRNAME} ${0} )/teardown-synch > /dev/stderr # | ${AT} now > /dev/null