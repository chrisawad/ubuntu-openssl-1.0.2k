FROM ubuntu
ENV PATH=$PATH:/usr/local/ssl/bin
WORKDIR /src

RUN apt -y update \
  && apt install -y build-essential git \
  && apt remove -y openssl \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/openssl/openssl.git \
  && cd openssl \
  && git checkout tags/OpenSSL_1_0_2k \
  && ./config \
  && make install \
  && cd .. \
  && rm -rf openssl
