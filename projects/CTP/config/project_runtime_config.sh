#!/bin/sh

##### Container Configuration Variables: #####

	# Container Variables That Must Be Unique For A Given Code Implementation To Allow Concurrent Runs
		# the project name, this must be unique to run more than one instance of CODE on a given container host machine, this will determine the container name and the folder name for the working copy of the repository on the server
		COMPOSE_PROJECT_NAME=code_ctp

	#--- Primary schema created by deployment script, used to check if the database is installed. If the APP_SCHEMA_NAME exists then do not run the database initialization processes ---
	APP_SCHEMA_NAME=TEMPL_PROJ_CAS

##### Project Configuration Variables: #####

	# define the container git project URL
	GIT_URL="git@github.com:noaa-pifsc/PIFSC-CTP-Containerized-Oracle-Development-Environment.git"