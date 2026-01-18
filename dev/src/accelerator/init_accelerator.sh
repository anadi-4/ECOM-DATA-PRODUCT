#!/usr/bin/env bash
set -e

if [ "$#" -ne 3 ] ;  then
	echo "usage $0 <ROOT_PATH> <PROJECT_NAME> <ENV>  "
	exit 1
fi

echo ########################################################################
echo ##################Create Project Directories############################
echo ########################################################################

GREEN="\033[0;32m"
NC="\033[0m"



 ROOT_PATH=$1
 PROJECT_NAME=$2
 ENV=$3

echo "Root Path: ${ROOT_PATh}"
echo "Project name: ${PROJECT_NAME}"
echo "Environment: ${ENV}"

BASE_PATH="${ROOT_PATH}/data-accelerators/${PROJECT_NAME}/${ENV}"


echo -e "${GREEN}Creating Project Directories ${NC}"

mkdir -p "${BASE_PATH}/src"
mkdir -p "${BASE_PATH}/src/accelerator"
mkdir -p "${BASE_PATH}/src/accelerator/spark"
mkdir -p "${BASE_PATH}/src/accelerator/io"
mkdir -p "${BASE_PATH}/src/accelerator/metadata"
mkdir -p "${BASE_PATH}/src/accelerator/pipelines"
mkdir -p "${BASE_PATH}/src/accelerator/utils"

mkdir -p "${BASE_PATH}/data"
mkdir -p "${BASE_PATH}/data/landing"
mkdir -p "${BASE_PATH}/data/bronze"
mkdir -p "${BASE_PATH}/data/silver"
mkdir -p "${BASE_PATH}/data/gold"

touch "${BASE_PATH}/src/accelerator"/__init__.py
echo -e "${GREEN}Successfully Created Project Directories ${NC}"
