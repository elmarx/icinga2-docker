#!/bin/sh

#set -o errexit
#set -o nounset

PREFIX=$(dirname $(readlink -f $0))/..

source ${PREFIX}/lib/set_mysql_config.sh
source ${PREFIX}/lib/import_schema.sh

# if there's no configuration yet (maybe because /etc/icinga2 was mounted) copy
# the default icinga2 configuration, so there's a starting point
if [ ! "$(ls -A /etc/icinga2)" ]; then
  cp -a /etc/icinga2.orig/. /etc/icinga2/
fi

import_schema


# mysql configuration as passed in via environment
set_mysql_config user $MYSQL_USER
set_mysql_config password $MYSQL_PASSWORD
set_mysql_config database $MYSQL_DATABASE
# database host ist configured via link (and /etc/hosts)
set_mysql_config host mysql

exec "$@"
