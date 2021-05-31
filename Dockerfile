FROM neuroforlunch/gnuradio-companion-plus:p0-base-ubuntu-20

RUN apt-get install -yq \
  libboost-dev \
  libboost-all-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libboost-regex-dev \
  libboost-test-dev \
  libconfig++-dev \
  liborc-0.4-dev \
  liborc-0.4-dev-bin \
  liblog4cpp5-dev \
  liblog4cpp5v5 \
  libzmq3-dev \
  libsdl-dev \
  thrift-compiler \
  fftw3-dev \
  libuhd-dev \
  codec2 \
  ocl-icd-opencl-dev \
  libfreetype6-dev \
  libglfw3-dev \
  libglfw3 \
  bison \
  flex \
  g++ \
  libclang1-6.0 \
  libevent-dev \
  libssl-dev \
  libtool \
  make \
  pkg-config \
  python-all \
  python-all-dev \
  python-babel-localedata \
  python3-all \
  python3-all-dev \
  python3-babel \
  python3-click-plugins \
  python3-imagesize \
  python3-scipy \
  python3-zmq



RUN apt-get install -yq \
  blt \
  fonts-lyx \
  javascript-common \
  tk8.6-blt2.5 \
  libcppunit-dev \
  libgmp-dev \
  libjs-jquery \
  libjs-jquery-ui \
  libqt5sql5-sqlite \
  librtlsdr0 \
  python-certifi \
  python-chardet \
  python-matplotlib-data \
  python-openssl \
  python-tk \
  python3-bs4 \
  python3-chardet \
  python3-cycler \
  python3-dateutil \
  python3-html5lib \
  python3-matplotlib \
  python3-networkx \
  python3-olefile \
  python3-pil \
  python3-pyparsing \
  python3-tk \
  python3-tz \
  python3-webencodings \
  ttf-bitstream-vera \
  qt5-gtk-platformtheme \
  qttranslations5-l10n \
  blt-demo \
  bzr \
  cron \
  dbus-user-session \
  debian-keyring \
  fonts-mathjax \
  g++-7-multilib \
  g++-multilib \
  gcc-7-locales \
  gcc-7-multilib \
  gcc-multilib \
  gcr \
  gnupg2 \
  lib32gcc-7-dev \
  lib32gcc1 \
  lib32gomp1 \
  lib32itm1 \
  lib32mpx2 \
  lib32quadmath0 \
  lib32stdc++-7-dev \
  lib32stdc++6 \
  lib32ubsan0 \
  libasound2-plugins \
  libb-hooks-endofscope-perl \
  libb-hooks-op-check-perl \
  libc6-dev-i386 \
  libc6-dev-x32 \
  libc6-i386 \
  libc6-x32 \
  libcairo-gobject-perl \
  libcairo-perl \
  libcanberra-pulse \
  libclass-method-modifiers-perl \
  libclass-xsaccessor-perl \
  libclone-perl \
  libconfig-any-perl \
  libconfig-general-perl \
  libconfig-tiny-perl \
  libcpanel-json-xs-perl \
  libdata-optlist-perl \
  libdata-perl-perl \
  libdata-record-perl \
  libdevel-callchecker-perl \
  libdevel-globaldestruction-perl \
  libdevel-hide-perl \
  libdynaloader-functions-perl \
  libexporter-lite-perl \
  libexporter-tiny-perl \
  libfile-configdir-perl \
  libfile-find-rule-perl \
  libfile-homedir-perl \
  libfile-which-perl \
  libgck-1-0 \
  libgcr-base-3-1 \
  libgcr-ui-3-1 \
  libgetopt-long-descriptive-perl \
  libglib-object-introspection-perl \
  libglib-perl \
  libgnupg-interface-perl \
  libgraphite2-utils \
  libgtk3-perl \
  libimport-into-perl \
  libintl-perl \
  libintl-xs-perl \
  libio-stringy-perl \
  libipc-system-simple-perl \
  libjs-mathjax \
  libjson-maybexs-perl \
  liblist-moreutils-perl \
  libmime-charset-perl \
  libmodule-implementation-perl \
  libmodule-pluggable-perl \
  libmodule-runtime-perl \
  libmoo-perl \
  libmoox-configfromfile-perl \
  libmoox-file-configdir-perl \
  libmoox-handlesvia-perl \
  libmoox-late-perl \
  libmoox-options-perl \
  libmpfr-dev \
  libnet-dbus-glib-perl \
  libnet-dbus-perl \
  libntl-dev \
  libnumber-compare-perl \
  libpackage-stash-perl \
  libpackage-stash-xs-perl \
  libpango-perl \
  libparams-classify-perl \
  libparams-util-perl \
  libparams-validate-perl \
  libpath-class-perl \
  libpath-tiny-perl \
  libpulsedsp \
  libreadonly-perl \
  libref-util-perl \
  libref-util-xs-perl \
  libregexp-common-perl \
  librole-tiny-perl \
  libsnapd-glib1 \
  libsombok3 \
  libspeexdsp1 \
  libstrictures-perl \
  libsub-exporter-perl \
  libsub-exporter-progressive-perl \
  libsub-identify-perl \
  libsub-install-perl \
  libsub-name-perl \
  libsub-quote-perl \
  libsub-uplevel-perl \
  libterm-size-any-perl \
  libterm-size-perl-perl \
  libtext-glob-perl \
  libtie-ixhash-perl \
  libtime-duration-parse-perl \
  libtime-duration-perl \
  libtype-tiny-perl \
  libtype-tiny-xs-perl \
  libtypes-path-tiny-perl \
  libunicode-linebreak-perl \
  libunicode-utf8-perl \
  libvariable-magic-perl \
  libwebrtc-audio-processing1 \
  libx32asan4 \
  libx32atomic1 \
  libx32cilkrts5 \
  libx32gcc-7-dev \
  libx32gcc1 \
  libx32gomp1 \
  libx32itm1 \
  libx32quadmath0 \
  libx32stdc++-7-dev \
  libx32stdc++6 \
  libx32ubsan0 \
  libxml-twig-perl \
  libxml-xpathengine-perl \
  libyaml-libyaml-perl \
  locales \
  logrotate \
  nas \
  pinentry-gnome3 \
  pulseaudio \
  pulseaudio-utils \
  rtkit \
  scdaemon \
  xloadimage \
  fonts-droid-fallback \
  fonts-noto-mono \
  ghostscript \
  gsfonts \
  imagemagick \
  imagemagick-6-common \
  imagemagick-6.q16 \
  libc-ares2 \
  libcupsfilters1 \
  libcupsimage2 \
  libdjvulibre-text \
  libdjvulibre21 \
  libgl1-mesa-glx \
  libgs9 \
  libgs9-common \
  libijs-0.35 \
  libjbig2dec0 \
  libjs-jquery-mousewheel \
  liblqr-1-0 \
  libnetpbm10 \
  libpaper-utils \
  libpaper1 \
  libqt5qml5 \
  libqt5quick5 \
  libqt5waylandclient5 \
  libqt5waylandcompositor5 \
  libwmf0.2-7 \
  netpbm \
  node-requirejs \
  nodejs \
  poppler-data \
  binfmt-support \
  dvipng \
  fig2dev \
  fonts-lato \
  fonts-lmodern \
  fonts-texgyre \
  gfortran \
  gfortran-7 \
  ipython3 \
  libatkmm-1.6-1v5 \
  libcairomm-1.0-1v5 \
  libcdr-0.1-1 \
  libgc1c2 \
  libgfortran-7-dev \
  libgle3 \
  libglibmm-2.4-1v5 \
  libgtkmm-2.4-1v5 \
  libgtkspell0 \
  libimage-magick-perl \
  libimage-magick-q16-perl \
  libjs-underscore \
  libkpathsea6 \
  libpangomm-1.4-1v5 \
  libpipeline1 \
  libpoppler-glib8 \
  libpotrace0 \
  libptexenc1 \
  librevenge-0.0-0 \
  libsigc++-2.0-0v5 \
  libterm-readkey-perl \
  libterm-readline-perl-perl \
  libtexluajit2 \
  libvisio-0.1-1 \
  libwmf-bin \
  libwpd-0.10-10 \
  libwpg-0.3-3 \
  libyaml-tiny-perl \
  libzzip-0-13 \
  lmodern \
  preview-latex-style \
  python-bs4 \
  python-cryptography-vectors \
  python-html5lib \
  python-lxml \
  python-numpy \
  scour \
  python-socks \
  python-webencodings \
  python3-beaker \
  python3-cairocffi \
  python3-cffi \
  python3-genshi \
  python3-ipython \
  python3-ipython-genutils \
  python3-nose \
  python3-pexpect \
  python3-pickleshare \
  python3-ply \
  python3-prompt-toolkit \
  python3-ptyprocess \
  python3-pycparser \
  python3-pydotplus \
  python3-pygments \
  python3-scour \
  python3-simplegeneric \
  python3-tornado \
  python3-traitlets \
  python3-wcwidth \
  python3-xcffib \
  rake \
  ruby \
  ruby-did-you-mean \
  ruby-minitest \
  ruby-net-telnet \
  ruby-power-assert \
  ruby-test-unit \
  rubygems-integration \
  scour \
  t1utils \
  tex-gyre \
  texlive-base \
  texlive-binaries \
  texlive-extra-utils \
  texlive-fonts-recommended \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-latex-recommended \
  texlive-pictures \
  texlive-plain-generic \
  tipa \
  tix \
  transfig \
  ttf-staypuft \
  unzip \
  xdg-user-dirs \
  zip
