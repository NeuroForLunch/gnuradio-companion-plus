FROM neuroforlunch/gnuradio-companion-plus:p4-modules-group1-u20

# Install gr-radar
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/NeuroForLunch/gr-radar.git --branch maint-3.8 \
  && cd gr-radar \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src

# Install gr-inspector
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/gnuradio/gr-inspector.git --branch maint-3.8 \
  && cd gr-inspector \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
# Install gr-bokehgui
RUN mkdir -p /src \
  && cd /src \
  && pip3 install bokeh \
  && git clone https://github.com/gnuradio/gr-bokehgui.git --branch maint-3.8 \
  && cd gr-bokehgui \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
# Install gr-doppler
RUN mkdir -p /src \
  && cd /src \
  && pip3 install orbit-predictor \
  && git clone https://github.com/acien101/gr-doppler.git \
  && cd gr-doppler \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
