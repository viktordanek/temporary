test_same( )
  {
    assert_equals "" "$( ${DIFF} --brief --recursive ${EXPECTED} ${OBSERVED} )" "We expect the expected and observed files to be exactly identical."
  } &&
  test_expected_observed ( )
    {
      ${FIND} ${EXPECTED} -type f | while read EXPECTED_FILE
      do
        assert_equals "$( ${CAT} ${EXPECTED_FILE} )" "$( ${CAT} ${EXPECTED_FILE}/${EXPECTED}/${OBSERVED} )" "EXPECTED:  We expect ${EXPECTED_FILE/${EXPECTED}} to be identical to ${EXPECTED_FILE}."
      done
    } &&
  test_observed_expected ( )
    {
      ${FIND} ${OBSERVED} -type f | while read OBSERVED_FILE
      do
        assert_equals "$( ${CAT} ${OBSERVED_FILE}/${EXPECTED}/${OBSERVED} )" "$( ${CAT} ${OBSERVED_FILE} )" "OBSERVED We expect ${OBSERVED_FILE/${OBSERVED}} to be identical to ${OBSERVED_FILE}."
      done
    }