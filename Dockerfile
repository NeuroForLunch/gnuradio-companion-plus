FROM neuroforlunch/gnuradio-companion-plus:p3

# Install gr-fosphor
RUN mkdir -p /src \
  && cd /src \
  && git clone -b gr3.8 https://github.com/osmocom/gr-fosphor.git \
  && cd gr-fosphor \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
