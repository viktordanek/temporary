{ pkgs , self } :
	{
		"0" =
			{
				"false" =
					{
						"78009b17" =
							[
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
							] ;
					} ;
				"true" =
					{
						"78009b17" =
							[
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"0","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											init =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ;} )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
							] ;
					} ;
			} ;
		"69" =
			{
				"false" =
					{
						"78009b17" =
							[
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"false","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
							] ;
					} ;
				"true" =
					{
						"78009b17" =
							[
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"lambda","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"0","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/init.sh" ;
														sets =
															[
																( is-file { name = "c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516" ; } )
																( is-pipe { name = "abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5" ; } )
																( string "JQ" "${ pkgs.jq }/bin/jq" )
																( path "POST_SEED" 1 )
																( resource { name = "b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6" ; } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871" ; } )
																( string "TEMPLATE_FILE" "/nix/store/7b4yhg2l1kwqm1zvhh52xyh9mr2bnm4w-source/scripts/test/temporary/init.json" )
																( derivation "TEMPORARY_TOKEN" ( harvest : harvest.temporary.util.token ) )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"lambda","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"fast"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
								# {"init-has-standard-error":"true","init-seed":"4b2606a6","init-standard-error":"bc866105","init-standard-output":"c881c3c9","init-status":"69","init-typeOf":"null","post-standard-error":"c852c926","post-standard-output":"29347a1e","post-status":"72","release-seed":"422eab48","release-standard-error":"215a0e24","release-standard-output":"ec9da50a","release-status":"71","release-typeOf":"null","seed":"78009b17","speed":"slow"}
								(
									{ derivation , grandparent-pid , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target } :
										{
											post =
												script
													{
														executable = shell-script "/scripts/test/temporary/post.sh" ;
														sets =
															[
																( string "CAT" "${ pkgs.coreutils }/bin/cat" )
																( string "CUT" "${ pkgs.coreutils }/bin/cut" )
																( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
																( string "FIND" "${ pkgs.findutils }/bin/find" )
																( string "FLOCK" "${ pkgs.flock }/bin/flock" )
																( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
																( derivation "POST" ( harvest : harvest.temporary.util.post ) )
																( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ;} )
																( string "RM" "${ pkgs.coreutils }/bin/rm" )
																( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
																( string "WC" "${ pkgs.coreutils }/bin/wc" )
															] ;
													} ;
										}
								)
							] ;
					} ;
			} ;
	}
