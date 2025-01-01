#!/bin/sh

test_fail( )
  {
    fail "WTF"
  } &&
test_same( )
  {
    asserts_equal "" "$( ${DIFF} --brief --recursive ${EXPECTED} ${OBSERVED} ) }" "We expect the expected and observed files to be exactly identical."
  }