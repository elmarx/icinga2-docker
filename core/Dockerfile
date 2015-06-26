FROM centos:centos7

MAINTAINER Elmar Athmer <elmar@athmer.org>

# install icinga2 as described in http://docs.icinga.org/icinga2/latest/doc/module/icinga2/toc#!/icinga2/latest/doc/module/icinga2/chapter/getting-started#installing-icinga2
# with the exception, that we donwnload the repo-file via docker

# additionally, we install maridb (-client) for initial schema-import
# we prepare icinga-dirs as done in icinga2's systemd-unit filename
# finally we copy the default icinga2-configuration for further reference
ADD http://packages.icinga.org/epel/ICINGA-release.repo /etc/yum.repos.d/
RUN rpm --import http://packages.icinga.org/icinga.key && \
    yum -y install epel-release && \
    yum -y install icinga2 icinga2-ido-mysql mariadb nagios-plugins-all && \
    yum clean all && \
    ln -sr /etc/icinga2/features-available/command.conf /etc/icinga2/features-enabled/ && \
    /usr/lib/icinga2/prepare-dirs /etc/sysconfig/icinga2 && \
    cp -a /etc/icinga2 /etc/icinga2.orig

ADD scripts /usr/local/

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
CMD ["/usr/sbin/icinga2", "daemon"]

# volumes for configfiles and external commands; TODO: and plugins
VOLUME ["/etc/icinga2", "/var/run/icinga2/cmd"]
