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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "false" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "HAS_STANDARD_ERROR" "true" )
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "4b2606a6" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "bc866105" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "c881c3c9" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
																( string "TEMPLATE_FILE" "/nix/store/2k3r2kicl2nd2n6clmr4366gfv3gnwv5-source/scripts/test/temporary/init.json" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "fast" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
											release =
												script
													{
														executable = shell-script "/scripts/test/temporary/release.sh" ;
														sets =
															[
																( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
																( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
																( path "POST_SEED" 1 )
																( resource { } )
																( string "SEED" "422eab48" )
																( string "SPEED" "slow" )
																( path "STATUS" 0 )
																( string "STANDARD_ERROR" "215a0e24" )
																( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
																( string "STANDARD_OUTPUT" "ec9da50a" )
																( string "STATUS" "0" )
																( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
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
																( string "STANDARD_ERROR" "c852c926" )
																( string "STANDARD_OUTPUT" "29347a1e" )
																( string "STATUS" "72" )
																( string "YQ" "${ pkgs.yq }/bin/yq" )
															] ;
													} ;
										}
								)
							] ;
					} ;
			} ;
	}
