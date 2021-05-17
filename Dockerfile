FROM neuroforlunch/gnuradio-companion-plus:p1

RUN pip install six

RUN apt-get install -yq gmplib-dev


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
