FROM neuroforlunch/gnuradio-companion-plus:p3


# Install gr-radar
RUN mkdir -p /src \
  && cd /src \
  && git clone -b maint-3.8 https://github.com/gnuradio/gnuradio.git /usr/lib/gnuradio \
  && git clone https://github.com/kit-cel/gr-radar.git /src/gr-radar \
  && cd gr-radar/ \
  && mkdir build \
  && cd build/ \
  && cmake -DCMAKE_PREFIX_PATH=/usr/lib/gnuradio .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# Free up some space
# RUN apt-get upgrade -yq
# RUN apt-get clean
# RUN apt-get autoclean
