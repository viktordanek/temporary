#!/bin/sh

RESOURCE=$( ${COREUTILS}/bin/mktemp --directory ${TEMPORARY_MASK} ) &&
  if [ -x ${STORE}/init ]
  then
    ${COREUTILS}/bin/ln --symbolic ${STORE}/init ${RESOURCE}/init
  fi &&
  if [ -x ${STORE}/release ]
  then
    ${COREUTILS}/bin/ln --symbolic ${STORE}/release ${RESOURCE}/release
  fi &&
  ${COREUTILS}/bin/ln --symbolic ${TEARDOWN} ${RESOURCE}/teardown-synch