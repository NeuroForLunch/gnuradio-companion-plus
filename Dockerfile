FROM neuroforlunch/gnuradio-companion-plus:p1-apt-dependencies

############################################################
# Build from source to get up to date versions
###########################################################

# Install cmake 3.20.3
RUN mkdir -p /src \
  && cd /src \
  && git clone https://gitlab.kitware.com/cmake/cmake.git --branch release \
  && cd cmake \
  && ./bootstrap \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
# Install Pybind11
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/pybind/pybind11.git --recursive --branch v2.4.0 \
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
  && ./configure --enable-cxx=detect \
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
  && cmake .. -DINSTALL_UDEV_RULES=ON \
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
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
# Install VOLK
RUN mkdir -p /src \
  && cd /src \
  && pip3 install six Mako \
  && git clone https://github.com/gnuradio/volk.git --recursive --branch v2.4.1 \
  && cd volk \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && volk_profile \
  && cd / \
  && rm -rf /src

