#!/bin/sh

#set -o errexit
#set -o nounset

PREFIX=$(dirname $(readlink -f $0))/..

source ${PREFIX}/lib/import_schema.sh
source ${PREFIX}/lib/set_mysql_config.sh
source ${PREFIX}/lib/setup_config.sh

setup_config

import_schema

exec "$@"
