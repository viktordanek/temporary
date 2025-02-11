{ echo , jq , self , speed , status , writeShellScript , yq } :
	{
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lbmmpmko.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		boglecmm.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mlhfnpcn.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ibhfnpmk.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		dknhhlap.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		gjaaabhd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		fndopfaj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		pbfbcmhn.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		nncbkbfi.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kckfmjkl.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mjaemmpg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fogojkpg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		hlehgkhg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ndojbpie.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kojobpam.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		pheobkcc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lkcboail.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		akclhcdc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kcpkibmp.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bpgblldd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		dbjnmbop.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		cgibkaci.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gggenkoe.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		eiflplgj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gfhljmam.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lebkibfl.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		nnfkobac.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		eanodacj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jddefkmb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jabpfhhh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kfcefeoh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		koccllhb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		pilmpmnc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		phcompgp.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		nbfdblfa.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kpjngfee.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gblohian.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bimgfolf.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jiofegpf.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		aheanlfh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mhglfgkg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		pfaafaem.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		idoeccoo.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ecmhffgg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		eebehnmd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		caanjcop.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		imcicjob.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		iajgeemc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		enccgihd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		glkmpnkd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cmejmibg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		janpojmc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		pjdhdiho.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lgknflbn.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ndibidib.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oaefhoee.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		canbbgni.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bompmkna.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		fejpjcog.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		noflhghh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mibpocoh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jcmhbaii.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cbnjefch.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		igioknin.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jobjbcih.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fbicllei.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		aemohhkn.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		klmncbbh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		hpieaacg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		igpnmfcb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bpdohgbm.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mhakinph.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bigagmom.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		nimmhkei.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ipafhieb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		akbbmoml.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		iileiakg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jenenafd.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		abcnjkfj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mkpkbope.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kjjinigj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		aajpbkop.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		oahdnhpe.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		cdfdepci.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gonijokb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ngkinfip.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mdfghmgg.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dicgcbfa.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		nnicgbfa.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		aodhpbfm.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		clplppeh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jppbpinb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		fnpdjpop.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hgehmpdf.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lihhbaca.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		cbbbfhio.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kmhmjhim.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fcmllmbf.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		hohlbmcl.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mpgkbidl.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		moocmafa.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bgibmmfb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lmdgkhli.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		pompknoo.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lkngmdck.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		decbiing.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jpkecdip.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oejldjed.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		idcjiole.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		idkplkki.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ikcajkbk.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fhpiomao.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-0" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		emdlbdjh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		migeleii.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		pilmckac.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oebjiega.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kljillhc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ipnfhbdo.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ajhefgpc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		heimieke.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		onngbabc.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oiinnmgj.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		eiadnbkh.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mmjccpna.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ljjnkgjl.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		djpfkceb.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ghdlpjbf.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"lambda","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		behegeoo.init-path-seed.release-path-seed = 
			script :
				{
					init =
						script
							{
								executable = writeShellScript "init" ( self + "/scripts/test/temporary.sh" ) ;
								sets =
									{ is-file , is-pipe , path , standard-input , string } :
										[
											( string "ECHO" "${ echo }" )
											( is-file "IS_FILE" )
											( is-pipe "IS_PIPE" )
											( string "JQ" "${ jq }" )
											( path "NAME" 2 )
											( path "PATH_SEED" 0 )
											( speed "SPEED" "${ speed }" )
											( string "STATUS" "${ status }" )
											( string "VARIABLE_SEED" "init-variable-seed-1" )
											( standard-input "STANDARD_INPUT" )
											( string "YQ" "${ yq }" )
										] ;
							} ;
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cblmacib.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dojegemp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ohadnigp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bjjbhphm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ggihoeim.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ahpbibpn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		dibnonkm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bjlilchb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mgeheacn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		gcnmhlog.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		nfildoke.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dkhdapjc.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		klgjmdij.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hdflfgpe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jncnpcec.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hfoffjnm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lffaibbh.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dfnahgng.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bfgafbjc.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jlegjikm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kgkfmhhh.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dkcjnpkp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		fjlglpcb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		eoffdcje.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		alpoadhd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		acgibojp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		beghpdgo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kgbcffpp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		alcfnifj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kmgbadid.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jcpkhado.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oheodbon.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		pokhjbkf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lbkfhidn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mfnnnbha.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mgiddlek.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		enodcico.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jkgklona.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mfdhnmaa.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		gcndjaae.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		oakogbne.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mnibegfh.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ljgmhjdp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hcfkpcdf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jdhbdijj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		accmaoan.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cenofjmh.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lcmbnppd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mahfnjid.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		emdkcjbb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jakplhlb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		npncglin.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		oplepblm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		anelodgd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		jbogeogg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		depnphmn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		imebnkee.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kbgcmgkk.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ocnahaea.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kcmifbbb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mdohamao.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fiajllaj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		phgdfapp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-0","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ophphenp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		efknkffe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dmdfcomg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gnmilola.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dmbbnood.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		demkehhg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		migflloe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ifplekil.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		opbbphpj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		hodfjmpm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dlifjapp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bbinilpd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lbfpnoha.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		aflgjjfb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		onfhnodd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		agilcjoe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		daiilbmo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		kkigeaom.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bgdhamgo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mbgkbmfo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		cjeljega.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		iofkidfj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kaiefdgc.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cchcogkp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ccfijojb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		gmepnpgg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		oodihghp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ejgkipbc.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		bkgkmjoe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mdpbdnoo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		dfnjgjip.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bpedlelh.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-0","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		mjmnoiok.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		odbbadkj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jlnojfia.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		agmbpmjn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ecliejpg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cagckiea.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		eiilamla.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		fhaoadkf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		emgiddlf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ifipcphf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hedlhbbg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ilnablhb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		jgkallfk.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		cnekaphf.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lpkbhcpi.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		keddhdgg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-0","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ombobedn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ghjnbebe.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		foapcmbd.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		lgenpalg.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		ceilojkk.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		bkdebnfo.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		hggggmin.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		iljlglgj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"lambda","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		cbgcgldn.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		aphhecnm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		kopdhipj.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		phipganb.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-0","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		lfkppclk.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		mblannde.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-0","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		fcbplgfm.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-0","speed":"speed"}
		ljcnphhp.init-path-seed.release-path-seed = 
			script :
				{
			} ;
		# {"init-path-seed":"init-path-seed","init-standard-error":"init-standard-error-1","init-standard-output":"init-standard-output-1","init-status":"status","init-typeOf":"null","init-variable-seed":"init-variable-seed-1","release-path-seed":"release-path-seed","release-standard-error":"release-standard-error-1","release-standard-output":"release-standard-output-1","release-status":"status","release-typeOf":"null","release-variable-seed":"release-variable-seed-1","speed":"speed"}
		liennmni.init-path-seed.release-path-seed = 
			script :
				{
			} ;
	}