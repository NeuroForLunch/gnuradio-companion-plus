FROM neuroforlunch/gnuradio-companion-plus:p2

RUN apt-get install -yq \
libsndfile1-dev \
libcairo2-dev \
python-gi-cairo


# Install GNUradio
# Blacklist the rtl dongle to prevent the system from auto-using it for TV purposes
# Add the necessary exports to have GRC load correctly
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/NeuroForLunch/gnuradio-darkmode.git --depth 1 --branch maint-3.8 \
  && cd gnuradio-darkmode \
  && mkdir build \
  && cd build && cmake -DENABLE_INTERNAL_VOLK=OFF ../ \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src \
  && echo "blacklist rtl2832\nblacklist rtl2830" > /etc/modprobe.d/blacklist-rtlsdr.conf \
  && echo 'export "PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.6/dist-packages:$PYTHONPATH"' >> ~/.profile \
  && echo 'export "LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"' >> ~/.profile \
  && echo 'export "PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.6/dist-packages:$PYTHONPATH"' > /etc/profile.d/gnuradio.sh \
  && echo 'export "LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"' >> ~/etc/profile.d/gnuradio.sh

# Blacklist the device as well

# Install gr-radar
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/kit-cel/gr-radar.git --branch maint-3.8 \
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
