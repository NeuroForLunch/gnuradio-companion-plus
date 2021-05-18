FROM neuroforlunch/gnuradio-companion-plus:p1


# Free up some space
RUN apt-get upgrade -yq
RUN apt-get clean
RUN apt-get autoclean
