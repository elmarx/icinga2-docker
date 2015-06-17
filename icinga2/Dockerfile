FROM centos:centos7

MAINTAINER Elmar Athmer <elmar@athmer.org>

# install icinga2 as described in http://docs.icinga.org/icinga2/latest/doc/module/icinga2/toc#!/icinga2/latest/doc/module/icinga2/chapter/getting-started#installing-icinga2
# with the exception, that we donwnload the repo-file via docker
ADD http://packages.icinga.org/epel/ICINGA-release.repo /etc/yum.repos.d/
RUN rpm --import http://packages.icinga.org/icinga.key && \
    yum -y install epel-release && \
    yum -y install icinga2 nagios-plugins-all icinga2-ido-mysql && \
    yum clean all && \
    /usr/lib/icinga2/prepare-dirs /etc/sysconfig/icinga2 # prepare icinga2 directories, as defined in systemd-unit file


CMD ["/usr/sbin/icinga2", "daemon"]

# volumes for configfiles and plugins
VOLUME ["/etc/icinga2", "/var/lib/icinga2"]
