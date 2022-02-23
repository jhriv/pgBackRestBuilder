FROM centos:7

# need the PGDG repository for libpq5-devel
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm; \
  yum install -y \
    gcc \
    make \
    bzip2-devel \
    libpq5-devel \
    libxml2-devel \
    libyaml-devel \
  ; \
  yum clean all
COPY compile /
CMD ["/bin/sh", "/compile"]
