#!/bin/sh

RESOURCE=$( ${COREUTILS}/bin/mktemp --directory ${TEMPORARY_MASK} ) &&
  if [ -x ${INIT} ]
  then
    ${COREUTILS}/bin/ln --symbolic ${INIT} ${RESOURCE}/init
  fi &&
  if [ -x ${RELEASE} ]
  then
    ${COREUTILS}/bin/ln --symbolic ${RELEASE} ${RESOURCE}/release
  fi &&
  ${COREUTILS}/bin/ln --symbolic ${TEARDOWN} ${RESOURCE}/teardown-synch