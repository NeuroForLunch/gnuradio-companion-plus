FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

# Get updates first
RUN apt-get update && apt-get upgrade -yq


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
  flex \
  libusb-dev \
  libusb-1.0-0-dev \
  graphviz \
  libportaudio2 \
  portaudio19-dev \
  libpulse-dev \
  libgsl-dev \
  libgsm1-dev \
  libasound2
