FROM neuroforlunch/gnuradio-companion-plus:p9

# Install GNUradio
RUN sudo mkdir -p /src \
  && git clone --depth 1 https://github.com/gnuradio/gnuradio.git /src/gnuradio --branch maint-3.8 \
  && cd /src/gnuradio \
  && mkdir build \
  && cd build && cmake -DENABLE_INTERNAL_VOLK=OFF ../ \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src



