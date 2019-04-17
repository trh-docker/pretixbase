FROM quay.io/spivegin/tlmpython:latest
WORKDIR /opt/tlm/
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    gettext \
    git \
    libffi-dev \
    libjpeg-dev \
    libmemcached-dev \
    libpq-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    locales \
    nginx \
    python-dev \
    python-virtualenv \
    python3-dev \
    sudo \
    supervisor \
    zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8 && \
    mkdir /etc/pretix && \
    mkdir /opt/tlm/data && \
    useradd -ms /bin/bash -d /opt/tlm/pretix -u 15371 pretixuser && \
    echo 'pretixuser ALL=(ALL) NOPASSWD: /usr/bin/supervisord' >> /etc/sudoers && \
    mkdir /opt/tlm/static &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

