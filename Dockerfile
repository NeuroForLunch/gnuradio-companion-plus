FROM neuroforlunch/gnuradio-companion-plus:p1

RUN pip install six

RUN apt-get install -yq \
  automake \
  texinfo

# Install the Multiple Precision Integers and Rationals Library
RUN mkdir -p /src \
  && git clone https://github.com/wbhart/mpir.git /src/mpir \
  && cd /src/mpir/ \
  && ./autogen.sh \
  && ./configure --enable-cxx=detect \
  && make \
  && make install \
  && ldconfig \
  && rm -rf /src
