#!/bin/bash

	# define the database scripts mapping using the pipe character as a delimiter
	# The elements should contain encoded values with the "|" character as the delimiter: sql path (within container)|sql script file|User Secret Name|Password Secret Name|Script Password Secrets (this can be one or more optional pipe-delimited secret names when a password is injected into the script - examples include a CREATE USER command) 

	# create schemas, apex workspace, apex developer account
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/CTP/modules/CTP/CTP/SQL|@dev_container_setup/create_docker_schemas.sql|oracle_admin_user|oracle_pwd|ctp_pwd|ctp_app_pwd|ctp_apx_user|ctp_apx_pwd")
	
	# deploy CTP DB
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/CTP/modules/CTP/CTP/SQL|@automated_deployments/deploy_dev_container.sql|ctp_user|ctp_pwd")

	# deploy CTP Apex app
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/CTP/modules/CTP/CTP/SQL|@automated_deployments/deploy_apex_dev.sql|ctp_app_user|ctp_app_pwd")

	# define the array of compose files that are used by the individual projects (specify the path relative to the core/build directory
	COMPOSE_FILES+=("../../projects/CTP/build/ctp_secrets.yml")
	
	# add the secrets
	SECRET_MAPPING_ARR+=(
		["ctp_pwd"]="CTP_DB_PWD"
		["ctp_user"]="CTP_DB_USER"
		["ctp_app_pwd"]="CTP_APP_PWD"
		["ctp_app_user"]="CTP_APP_USER"
		["ctp_apx_user"]="CTP_APX_USER"
		["ctp_apx_pwd"]="CTP_APX_PWD"
	)
	
	