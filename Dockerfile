FROM neuroforlunch/gnuradio-companion-plus:p1

RUN apt-get install -yq \
  libboost-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libboost-regex-dev \
  libboost-test-dev \
  libconfig++-dev \
  liborc-0.4-dev \
  liborc-0.4-dev-bin

#  libgmp-dev \


# Install gr-osmosdr
RUN mkdir -p /src \
  && cd /src \
  && git clone -b gr3.8 https://github.com/osmocom/gr-osmosdr.git \
  && cd gr-osmosdr/ \
  && mkdir build \
  && cd build \
  && cmake ../ \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# Install SoapyRTLSDR
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/pothosware/SoapyRTLSDR.git \
  && cd SoapyRTLSDR/ \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# Install gr-soapy
RUN mkdir -p /src \
  && cd /src \
  && git clone https://gitlab.com/librespacefoundation/gr-soapy.git \
  && cd gr-soapy \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
