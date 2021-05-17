FROM neuroforlunch/gnuradio-companion-plus:p1

RUN pip install six

# Install the Multiple Precision Integers and Rationals Library
RUN mkdir -p /src \
  && git clone --depth 1 https://github.com/wbhart/mpir.git /src/mpir \
  && cd /src/mpir/ \
	&& ./configure --enable-cxx=detect \
  && make \
	&& make install \
  && ldconfig \
  && rm -rf /src


# Install the GNU Multiple Precision Arithmetic Library
RUN mkdir -p /src \
  && git clone https://github.com/NeuroForLunch/gmp-releases.git /src/gmp/ \
  && cd /src/gmp/ \
	&& sh ./configure --enable-cxx=detect \
  && make \
	&& make install \
  && ldconfig \
  && rm -rf /src



# Install gr-radar
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/kit-cel/gr-radar.git /src/gr-radar \
  && cd gr-radar/ \
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
