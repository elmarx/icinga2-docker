FROM centos:centos7

MAINTAINER Elmar Athmer <elmar@athmer.org>

# install icingaweb2 as described in http://docs.icinga.org/icinga2/latest/doc/module/icinga2/toc#!/icinga2/latest/doc/module/icinga2/chapter/getting-started#installing-icinga2
# and https://github.com/Icinga/icingaweb2/blob/master/doc/installation.md
# with the exception, that we donwnload the repo-file via docker
ADD http://packages.icinga.org/epel/ICINGA-release.repo /etc/yum.repos.d/
RUN rpm --import http://packages.icinga.org/icinga.key && \
    yum -y install epel-release && \
    yum -y install icingacli httpd php-ZendFramework-Db-Adapter-Pdo-Mysql && \
    yum -y install --setopt=tsflags='' icingaweb2 \
    yum clean all && \
    icingacli setup config webserver apache \
      --document-root /usr/share/icingaweb2/public > \
      /etc/httpd/conf.d/icingaweb2.conf && \
    sed -i s/"^;\(date.timezone =\)"/"\1 UTC"/ /etc/php.ini # TODO: move this to a startup-script, so we can set this via environment-variable

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
