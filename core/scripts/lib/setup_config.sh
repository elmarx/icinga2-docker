# run all step required for a basic icinga2 configuration
setup_config() {
  # if there's no configuration yet (maybe because /etc/icinga2 was mounted) copy
  # the default icinga2 configuration, so there's a starting point
  if [ ! "$(ls -A /etc/icinga2)" ]; then
    echo "* no icinga2 configuration detected, creating default configuration"
    cp -a /etc/icinga2.orig/. /etc/icinga2/
  fi


  echo "* setting mysql connection in /etc/icinga2/features-available/ido-mysql.conf"
  set_mysql_config
}
