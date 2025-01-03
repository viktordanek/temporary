test_same( )
  {
    assert_equals "" "$( ${DIFF} --brief --recursive ${EXPECTED} ${OBSERVED} )" "We expect the expected and observed files to be exactly identical."
  }
  test_expected_observed ( )
    {
      ${FIND} ${EXPECTED} -type f | while read EXPECTED_FILE
      do
        assert_equals "$( ${CAT} ${EXPECTED_FILE} )" "$( ${CAT} ${EXPECTED_FILE/${EXPECTED}/${OBSERVED}} )" "We expect ${EXPECTED_FILE/${EXPECTED}} to be identical to ${EXPECTED_FILE}."
      done
    }