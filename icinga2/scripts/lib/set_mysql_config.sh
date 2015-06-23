#!/bin/sh

# set a key in ido-mysql configuration
# arg1 = key
# arg2 = value
set_mysql_config() {
  local key=${1}
  local value=${2}

  local filename="/etc/icinga2/features-available/ido-mysql.conf"

  sed -i s#"^\s*//${key} = .*"#"    ${key} = \"${value}\""# ${filename}
}
