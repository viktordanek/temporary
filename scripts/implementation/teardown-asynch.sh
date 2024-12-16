#!/bin/sh

${ECHO} ${NICE} --adjustment 19 $( ${DIRNAME} ${0} )/teardown-synch | ${AT} now > /dev/null