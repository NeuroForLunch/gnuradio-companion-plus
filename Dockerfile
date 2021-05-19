FROM neuroforlunch/gnuradio-companion-plus:p1


RUN pip install orbit-predictor \
  && pip3 install orbit-predictor

RUN apt-get install -yq \
  libboost-dev \
  libboost-all-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libboost-regex-dev \
  libboost-test-dev \
  libconfig++-dev \
  liborc-0.4-dev \
  liborc-0.4-dev-bin \
  liblog4cpp5-dev \
  liblog4cpp5v5
  libzmq3-dev \
  libsdl-dev \
  thrift-compiler \
  fftw3-dev \
  libuhd-dev \
  codec2 \
  ocl-icd-opencl-dev \
  libfreetype6-dev \
  libglfw3-dev \
  libglfw3 \
  bison \
  flex \
  g++ \
  libevent-dev \
  libssl-dev \
  libtool \
  make \
  pkg-config \
  python-all \
  python-all-dev \
  python-all-dbg \
  python3-all \
  python3-all-dev \
  python3-all-dbg


# Install missing files
COPY gnuradio /usr/lib/x86_64-linux-gnu/cmake/

# Install some examples
COPY grc-examples /root/desktop
