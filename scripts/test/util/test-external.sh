if [ ! -z $( ${BASH_UNIT} ${EXPECTED} ${OBSERVED} ) ]
then
  exit 64
fi