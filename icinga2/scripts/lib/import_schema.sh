# execute the schema-creation script provided by ido-mysql
import_schema() {
  alias mysql="mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h mysql icinga"

  # check if we have any tables, and if not, import these
  if [ ! "$(mysql -BN -e 'show tables;')" ]; then
    mysql < /usr/share/icinga2-ido-mysql/schema/mysql.sql
  fi
}
