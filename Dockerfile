FROM centos:7
MAINTAINER sean0628

ARG ruby_version='2.7.0-dev'

RUN yum -y update
RUN yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel ruby
RUN yum clean all


RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN mkdir -p usr/local/rbenv/plugins
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build

RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init --no-rehash -)"' >> /etc/profile.d/rbenv.sh

RUN exec $SHELL

RUN source /etc/profile.d/rbenv.sh; rbenv install ${ruby_version}; rbenv global ${ruby_version}

WORKDIR /app
COPY app /app
