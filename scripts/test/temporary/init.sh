RESOURCE=${b6cba2f07dd0c2816e7e54f828051b800f5cffa1a140c72b0bf080dde92612d29449b0807c1217113ad8f5e2c72ca14e215c9f9eb83fae2dc1118c3e40691052} &&
  TARGET=${f4feff7b45aaaec6851766ef42a9bb5d48952cc98ea24dd0be0f5787540b5d194e6989e9e46b2a74ebe3f28aaf93bc93afcae2d197bf29f75b4c718c60c9e5f3} &&
  ${ECHO} ${STANDARD_OUTPUT} &&
  ${JQ} -n -f ${ self + "/scripts/test/temporary/init.json" } | ${YQ} --yaml-output "init:."> ${TARGET} &&
  ${ECHO} ${STANDARD_ERROR} >&2 &&
  exit ${STATUS}