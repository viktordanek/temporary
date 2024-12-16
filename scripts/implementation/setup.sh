#!/bin/sh

RESOURCE=$( ${COREUTILS}/bin/mktemp --directory ${TEMPORARY_MASK} ) &&
  if [ -x ]