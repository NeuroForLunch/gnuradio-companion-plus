FROM neuroforlunch/gnuradio-companion-plus:p3-gnuradio-darkmode-u18


RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/osmocom/gr-osmosdr.git --branch gr3.8 \
  && cd gr-osmosdr \
  && mkdir build \
  && cd build \
  && cmake -DENABLE_REDPITAYA=OFF -DENABLE_RFSPACE=OFF .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
  
  
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/pothosware/SoapyRTLSDR.git \
  && cd SoapyRTLSDR \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
 RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/thestk/rtaudio.git --depth 1 \
  && cd rtaudio \
  && ./autogen.sh \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src  
  
  
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/Hamlib/Hamlib.git --depth 1 \
  && cd Hamlib \
  && ./bootstrap \
  && ./configure \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
  RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/pothosware/SoapyAudio.git \
  && cd SoapyAudio \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
  RUN mkdir -p /src \
  && cd /src \
  && pip3 install Mako \
  && git clone https://gitlab.com/librespacefoundation/gr-soapy.git \
  && cd gr-soapy \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/
  
  
  RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/jolivain/gr-pipe.git \
  && cd gr-pipe \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/jgaeddert/liquid-dsp.git \
  && cd liquid-dsp \
  && ./bootstrap.sh \
  && CFLAGS="-march=native -O3" ./configure --enable-fftoverride \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src  
  
  
RUN apt-get install -yq libarmadillo-dev libarmadillo8

RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/perspectalabs/gr-aep.git \
  && cd gr-aep \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
  
  RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/ghostop14/gr-correctiq.git --branch maint-3.8 \
  && cd gr-correctiq \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src
