FROM extvos/centos
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
ENV PYTHON_VERSION 2.7.6

RUN yum groupinstall -y "Development tools"  \
	&& yum install -y zlib-devel \
	&& yum install -y bzip2-devel \
	&& yum install -y openssl-devel \
	&& yum install -y ncurses-devel \
	&& yum install -y sqlite-devel

RUN cd /opt \
	&& wget --no-check-certificate https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz \
	&& tar xf Python-2.7.6.tar.xz \
	&& cd Python-2.7.6 \
	&& ./configure --prefix=/usr/local \
	&& make && make altinstall \
	&& ln -s /usr/local/bin/python2.7 /usr/local/bin/python \
	&& cd ../ \
	&& rm -rf Python-2.7.6.tar.xz Python-2.7.6

RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py \
	&& /usr/local/bin/python2.7 ez_setup.py \
	&& rm -f ez_setup.py \
	&& /usr/local/bin/easy_install-2.7 pip