# execute the schema-creation script provided by ido-mysql
import_schema() {
  local mysql="mysql --connect-timeout=10 -h mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} icinga"

  echo -n "* waiting for mysql-server to be ready"
  # wait until mysql is available
  while ! $mysql -e status &> /dev/null; do
    sleep 1s
    echo -n "."
  done
  echo ""

  # check if we have any tables, and if not, import these
  if [ ! "$(${mysql} -BN -e 'show tables;')" ]; then
    echo "* mysql database has not yet been set up, importing schema"
    $mysql < /usr/share/icinga2-ido-mysql/schema/mysql.sql
  fi
}
