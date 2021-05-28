FROM neuroforlunch/gnuradio-companion-plus:p4

# Install gr-fosphor & fix gpu issue
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/osmocom/gr-fosphor.git --branch gr3.8 \
  && cd gr-fosphor \
  && sed -i '/FLG_FOSPHOR_USE_CLGL_SHARING/ s/1<<0/0<<0/' lib/fosphor/private.h \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
