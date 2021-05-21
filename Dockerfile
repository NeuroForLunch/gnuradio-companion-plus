FROM neuroforlunch/gnuradio-companion-base:v1


# Get the building supplies
RUN add-apt-repository --remove ppa:gnuradio/gnuradio-releases \
  && apt-get update \
  && apt-get install -yq \
  ca-certificates \
  apt-utils

RUN apt-get upgrade -yq

RUN apt-get install -yq \
  git \
  gettext \
  autoconf \
  automake \
  autotools-dev \
  libtool \
  texinfo \
  yasm \
  build-essential \
  ccache \
  cmake \
  swig \
  libqt4-dev \
  libqwt-dev \
  libqwt5-qt4 \
  libqwt-qt5-dev \
  libqwt6abi1 \
  qtbase5-dev \
  pyqt4-dev-tools \
  pyqt5-dev-tools \
  python-dev \
  python-pip \
  python3-dev \
  python3-dbg \
  python3-pip \
  xvfb \
  lcov \
  thrift-compiler \
  gawk \
  byacc \
  flex

# Install drivers
RUN apt-get install -yq \
  libusb-dev \
  libusb-1.0-0-dev \
  graphviz \
  libportaudio2 \
  portaudio19-dev \
  libpulse-dev \
  libgsl-dev \
  libgsm1-dev \
  libasound2


RUN pip install six && pip3 install six

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
  && rm -rf /src

# Install Pybind11
RUN mkdir -p /src/build
RUN git clone --recursive https://github.com/pybind/pybind11.git /src/pybind11 --branch v2.4.0
RUN cd /src/build \
  && cmake -DPYBIND11_TEST=OFF /src/pybind11 \
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
