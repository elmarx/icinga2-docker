# set a key in ido-mysql configuration
# arg1 = key
# arg2 = value
set_key() {
  local key=${1}
  local value=${2}

  local filename="/etc/icinga2/features-available/ido-mysql.conf"

  sed -i s#"^\s*//${key} = .*"#"    ${key} = \"${value}\""# ${filename}
}

# set up icinga2's ido-mysql connection
set_mysql_config() {
  # mysql configuration as passed in via environment
  set_key user $MYSQL_USER
  set_key password $MYSQL_PASSWORD
  set_key database $MYSQL_DATABASE
  # database host ist configured via link (and /etc/hosts)
  set_key host mysql
}
