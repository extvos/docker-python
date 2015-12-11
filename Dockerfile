FROM extvos/centos
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
ENV PYTHON_MAJOR   2.7
ENV PYTHON_VERSION 2.7.6

RUN yum install -y xz autoconf automake gcc zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel mysql-devel

RUN cd /opt \
	&& wget --no-check-certificate https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz \
	&& tar xf Python-${PYTHON_VERSION}.tar.xz \
	&& cd Python-${PYTHON_VERSION} \
	&& ./configure --prefix=/usr/local \
	&& make && make altinstall \
	&& ln -s /usr/local/bin/python${PYTHON_MAJOR} /usr/local/bin/python \
	&& cd ../ \
	&& rm -rf Python-${PYTHON_VERSION}.tar.xz Python-${PYTHON_VERSION}

RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py \
	&& /usr/local/bin/python${PYTHON_MAJOR} ez_setup.py \
	&& rm -f ez_setup.py \
	&& /usr/local/bin/easy_install-${PYTHON_MAJOR} pip