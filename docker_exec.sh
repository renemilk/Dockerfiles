#!/bin/bash
#
# This file is part of the dune-community/Dockerfiles project:
#   https://github.com/dune-community/Dockerfiles
# Copyright 2017 dune-community/Dockerfiles developers and contributors. All rights reserved.
# License: Dual licensed as BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)
#      or  GPL-2.0+ (http://opensource.org/licenses/gpl-license)
# Authors:
#   Felix Schindler (2017)

if (( "$#" < 3 )); then
  echo ""
  echo "usage: ${0}  CONTAINER  PROJECT  LIST_OF_COMMANDS"
  echo ""
  exit 1
fi

export BASEDIR=$PWD
export CONTAINER=${1}
export SYSTEM=${CONTAINER%%-*}
export PROJECT=${2}
shift 2
export CID_FILE=${BASEDIR}/.${PROJECT}-${SYSTEM}-${CONTAINER}.cid

sudo docker exec -it $(cat ${CID_FILE}) gosu $USER "${@}"

