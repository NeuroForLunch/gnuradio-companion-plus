FROM neuroforlunch/gnuradio-companion-plus:p4

# Install gr-fosphor
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/osmocom/gr-fosphor.git --branch gr3.8 \
  && cd gr-fosphor \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
