test_same( )
  {
    assert_equals "" "$( ${DIFF} --brief --recursive ${EXPECTED} ${OBSERVED} )" "We expect the expected and observed files to be exactly identical."
  } &&
  test_expected_observed ( )
    {
      ${FIND} ${EXPECTED} -type f | while read EXPECTED_FILE
      do
        RELATIVE_PATH=${EXPECTED_FILE#"${EXPECTED}/"} &&
          OBSERVED_FILE=${OBSERVED}/${}RELATIVE_PATH} &&
          assert_equals "$( ${CAT} ${EXPECTED_FILE} )" "$( ${CAT} ${OBSERVED_FILE} )" "EXPECTED ${RELATIVE_PATH}:  We expect EXPECTED_FILE} to be identical to OBSERVED_FILE."
      done
    } &&
  test_observed_expected ( )
    {
      ${FIND} ${OBSERVED} -type f | while read OBSERVED_FILE
      do
        RELATIVE_PATH=${OBSERVED_FILE#"${OBSERVED}/"} &&
          EXPECTED_FILE=${EXPECTED}/${}RELATIVE_PATH} &&
          assert_equals "$( ${CAT} ${EXPECTED_FILE} )" "$( ${CAT} ${OBSERVED_FILE} )" "OBSERVED ${RELATIVE_PATH}: We expect OBSERVED_FILE to be identical to OBSERVED_FILE."
      done
    }