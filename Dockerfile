FROM django:1.10-python3
MAINTAINER Ranger.Huang <ranger.huang@ccplay.cc>

RUN mkdir /code
WORKDIR /code
RUN apt-get update && apt-get install -y mercurial && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD requirements.txt /tmp/requirements.txt
COPY docker-entrypoint.sh /code
RUN chmod a+x docker-entrypoint.sh
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt
