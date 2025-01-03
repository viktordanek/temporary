test_same( )
  {
    assert_equals "" "$( ${DIFF} --brief --recursive ${EXPECTED} ${OBSERVED} )" "We expect the expected and observed files to be exactly identical."
  }