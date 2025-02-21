{ cat , cut , echo , find , flock , jq , mkdir , rm , sha512sum , self , yq } :
	{
		"0" =
			{
				"false" =
					{
						"lambda" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
						"null" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "false" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
					} ;
				"true" =
					{
						"lambda" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
						"null" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													init =
														script
															{
																executable = shell-script "/scripts/test/temporary/init.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "FIND" "${ find }" )
																		( string "HAS_STANDARD_ERROR" "true" )
																		( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																		( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																		( string "SEED" "1504d2e9be0e5b88c53cd153273583ee757ebb1355044e3e7be673f26695462d1c6b8ee23435e5ea07d2b51334592300310a3d19e83904ba4081075049aeccef" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "148e8828aee5da84f198964f3f7d885ebd8700892834020b4cb787f1dc9986cd1b1a9cd78c7b01e65e36ce4d56cc2b973ba7e8c1fcebe6062834843e8b52d8ee" )
																		( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																		( string "STANDARD_OUTPUT" "df5729dfac5028b0898ea41eb589fecb85e60a8f87b0232280d2296fed8cdbe0b3b452fe79668436e594276015f1800b3483bcc07b9a338ee081f583ae2d421c" )
																		( string "STATUS" "0" )
																		( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/init.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
					} ;
			} ;
		"69" =
			{
				"false" =
					{
						"lambda" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
						"null" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
					} ;
				"true" =
					{
						"lambda" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
						"null" =
							{
								"f9b1202d9e218ecb6041ddca6aad80d2e100babd6f2cfba639db1fef0ea56cc2b7be2eba8aaf0d4dd068044c337e541e1d86028feee0573e8af2ab0f6748fa13" =
									[
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "fast" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
													release =
														script
															{
																executable = shell-script "/scripts/test/temporary/release.sh" ;
																sets =
																	[
																		( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																		( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																		( string "JQ" "${ jq }" )
																		( path "PATH_SEED" 1 )
																		( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																		( string "SEED" "ec7804a9dea9592a4d5c11b6cade83c9ed7aeb4244fce4a385c36796a03f818c71451a222853d2d4f9774452cfc71d1f2baa52a8cbbd49daf776e0c3a786f67a" )
																		( string "SPEED" "slow" )
																		( path "STATUS" 0 )
																		( string "STANDARD_ERROR" "3d7b7bf2679c18cdbab74ce98c015b85eac356f5c4ed4b060d134fd3170ddb241f6532eb7c2ba51bbd42b9af16261ecd2fefbfb977260e2d0660f3ce05cc98b6" )
																		( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																		( string "STANDARD_OUTPUT" "8bd08b9710b4280e026fdc531955faabb9c35929f71ffa51e48f8dbb7d7546c203d2e5acd7ad3ff47f3ef08ba334c8d0f4e3d94344eb7f9487cf51be477c61fa" )
																		( string "STATUS" "0" )
																		( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																		( string "TEMPLATE_FILE" "/nix/store/lpbdbjxga0xjlkgfwlly1nhcswbi7pv9-source/scripts/test/temporary/release.json" )
																		( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
										(
											{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , store , string , target , write-shell-script } :
												{
													post =
														script
															{
																executable = shell-script "/scripts/test/temporary/post.sh" ;
																sets =
																	[
																		( string "CAT" "${ cat }" )
																		( string "CUT" "${ cut }" )
																		( string "ECHO" "${ echo }" )
																		( string "FLOCK" "${ echo }" )
																		( string "MKDIR" "${ mkdir }" )
																		( path "PATH_SEED" 1 )
																		( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																		( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																		( string "RM" "${ rm }" )
																		( string "SHA512SUM" "${ sha512sum }" )
																		( string "STANDARD_ERROR" "d075d180a3634c2269413488f24f035d54b242d4ec2fa2705d3a0b464cee48f26bd12cc09c235372b5786a6bf32397c8584e61b3a1ab2a4b384321617763fba4" )
																		( string "STANDARD_OUTPUT" "0ea0feeb18d0a7fbfe882e20b59931ac17712685c7d9bc62a8c0e21fda4879c266501b5285bc2d21c427fbbe126d94cf1166989eb64967ac7d996b0b73f759d2" )
																		( string "STATUS" "72" )
																		( string "YQ" "${ yq }" )
																	] ;
															} ;
												}
										)
									] ;
							} ;
					} ;
			} ;
	}
