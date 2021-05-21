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


# GNU Radio OsmoSDR
# https://osmocom.org/projects/gr-osmosdr/wiki/GrOsmoSDR
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/osmocom/gr-osmosdr.git --branch gr3.8 \
  && cd gr-osmosdr \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# GNU Radio PDU Utilities
# https://github.com/sandialabs/gr-pdu_utils
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/sandialabs/gr-fhss_utils.git --branch maint-3.8 \
  && cd gr-fhss_utils \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# GNU Radio Timing Utilities
# https://github.com/sandialabs/gr-timing_utils
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/sandialabs/gr-timing_utils.git --branch maint-3.8 \
  && cd gr-timing_utils \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# GNU Radio FHSS Utilities
# https://github.com/sandialabs/gr-fhss_utils
RUN mkdir -p /src \
  && cd /src \
  && git clone https://github.com/sandialabs/gr-fhss_utils.git --branch maint-3.8 \
  && cd gr-fhss_utils \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install \
  && ldconfig \
  && cd / \
  && rm -rf /src/


# GNU Radio Sandia Utilities
# https://github.com/sandialabs/gr-sandia_utils
#RUN mkdir -p /src \
#  && cd /src \
#  && git clone https://github.com/sandialabs/gr-sandia_utils.git --branch maint-3.8 \
#  && cd gr-sandia_utils \
#  && mkdir build \
#  && cd build \
#  && cmake .. \
#  && make install \
#  && ldconfig \
#  && cd / \
#  && rm -rf /src/


