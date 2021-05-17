FROM neuroforlunch/gnuradio-companion-base:v1


# Get the building supplies
RUN add-apt-repository --remove ppa:gnuradio/gnuradio-releases \
  && apt-get update \
  && apt-get install -yq \
  ca-certificates \
  apt-utils

RUN apt-get install -yq \
  git \
  apt-utils \
  build-essential \
  ccache \
  cmake \
  swig \
  python-dev \
  python3-dev \
  python3-dbg \
  xvfb \
  lcov \
  thrift-compiler \
  --no-install-recommends


# Install drivers
RUN apt-get update && apt-get install -yq \
  libusb-dev \
  libusb-1.0-0-dev \
  graphviz \
  libportaudio2 \
  portaudio19-dev \
  libpulse-dev \
  libgsl-dev \
  libgsm1-dev \
  libasound2


# apt-get sources are outdated for the programs that follow

# Install VOLK
RUN mkdir -p /src/build
RUN git clone --recursive https://github.com/gnuradio/volk.git /src/volk --branch v2.4.1
RUN cd /src/build \
  && cmake -DCMAKE_BUILD_TYPE=Release ../volk/ \
  && make \
  && make install \
  && ldconfig \
  && volk_profile \
  && cd / \
  && rm -rf /src/

# Install Pybind11
RUN mkdir -p /src/build
RUN git clone --recursive https://github.com/pybind/pybind11.git /src/pybind11 --branch v2.4.0
RUN cd /src/build \
  && cmake -DPYBIND11_TEST=OFF /src/pybind11 \
  && make install \
  && ldconfig \
  && rm -rf /src/

# Install SoapySDR
RUN mkdir -p /src \
  && cd /src \
  && git clone -b soapy-sdr-0.8.0 https://github.com/pothosware/SoapySDR \
  && cd SoapySDR \
  && mkdir build \
  && cd build \
  && cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


#Prepare for the radar installation
RUN apt-get install -yq
  build-base \
  autoconf \
  automake \
  libtool \
  texinfo \
  yasm \
  --no-install-recommends


# Install the Multiple Precision Integers and Rationals Library
RUN mkdir -p /src \
  && git clone --depth 1 https://github.com/wbhart/mpir.git /src/mpir \
  && cd /src/mpir \
  && ./autogen.sh \
	&& ./configure --enable-cxx=detect \
  && make check \
	&& make install \
  && rm -rf /src


# Install the GNU Multiple Precision Arithmetic Library
RUN mkdir -p /src \
  && git clone https://github.com/NeuroForLunch/gmp-releases.git /src/gmp \
  && cd /src/gmp \
	&& ./configure --enable-cxx=detect \
	&& make check \
	&& make install \
  && rm -rf /src



# Install gr-radar
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/kit-cel/gr-radar.git /src/gr-radar \
  && cd gr-radar \
  && mkdir build \
  && cd build/ \
  && cmake ../ \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# Free up some space
# RUN apt-get upgrade -yq
# RUN apt-get clean
# RUN apt-get autoclean
