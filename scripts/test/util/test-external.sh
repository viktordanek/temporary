if [ ! -d ${EXPECTED} ]
then
  exit 64
elif [ ! -d ${OBSERVED} ]
then
  exit 65
elif ! ${BASH_UNIT} ${TEST_INTERNAL} > /dev/null
then
  exit 66
else
  exit 0
fi