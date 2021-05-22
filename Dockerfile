FROM neuroforlunch/gnuradio-companion-base:v2

RUN pip install six \
    orbit-predictor

RUN pip3 install six \
    orbit-predictor

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
  liblog4cpp5v5 \
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
  libclang1-6.0 \
  libevent-dev \
  libssl-dev \
  libtool \
  make \
  pkg-config \
  python-all \
  python-all-dev \
  python-all-dbg \
  python-babel-localedata \
  python3-all \
  python3-all-dbg \
  python3-all-dev \
  python3-babel \
  python3-click-plugins \
  python3-imagesize \
  python3-scipy \
  python3-zmq

############################################################
# apt-get sources are outdated for the programs that follow
###########################################################

# Install VOLK
RUN mkdir -p /src \
  && cd /src \
  && git clone --recursive https://github.com/gnuradio/volk.git --branch v2.4.1 \
  && cd volk \
  && mkdir build \
  && cd build \
  && cmake -DCMAKE_BUILD_TYPE=Release ../volk/ \
  && make \
  && make install \
  && ldconfig \
  && volk_profile \
  && cd / \
  && rm -rf /src

# Install Pybind11
RUN mkdir -p /src \
  && cd /src \
  && git clone --recursive https://github.com/pybind/pybind11.git --branch v2.4.0 \
  && cd pybind11 \
  && mkdir build \
  && cd build \
  && cmake -DPYBIND11_TEST=OFF /src/pybind11 \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src


# Install the Multiple Precision Integers and Rationals Library
RUN mkdir -p /src \
  && git clone https://github.com/wbhart/mpir.git /src/mpir \
  && cd /src/mpir \
  && ./autogen.sh \
  && ./configure --enable-cxx=detect \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src



# Install the GNU Multiple Precision Arithmetic Library
RUN mkdir -p /opt \
  && git clone https://github.com/NeuroForLunch/gmp-releases.git /opt/gmp \
  && cd /opt/gmp \
  && sh ./configure --enable-cxx=detect \
  && make \
  && make install \
  && ldconfig


# Install osmocom-rtlsdr
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/osmocom/rtl-sdr.git \
  && cd rtl-sdr \
  && mkdir build \
  && cd build \
  && cmake ../ -DINSTALL_UDEV_RULES=ON \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
# Install SoapySDR
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/pothosware/SoapySDR --branch soapy-sdr-0.8.0 \
  && cd SoapySDR \
  && mkdir build \
  && cd build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
