FROM neuroforlunch/gnuradio-companion-plus:p1

RUN pip install six

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
