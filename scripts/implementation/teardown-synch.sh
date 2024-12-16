#!/bin/sh

RESOURCE=$( ${COREUTILS}/bin/mktemp -t ${TEMPORARY_RESOURCE_MASK} ) &&
  if [ -x ${INIT} ]
  then
    ${COREUTILS}/bin/ln --symbolic ${INIT} ${RESOURCE}/init.sh
  fi &&
  if [ -x ${RELEASE} ]
  then
    ${COREUTILS}/bin/ln --symbolic ${RELEASE} ${RESOURCE}/release.sh
  fi &&
  