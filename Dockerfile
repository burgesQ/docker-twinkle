FROM debian:9

RUN apt update && \
  apt install -y \
  alsa-utils \
  bison build-essential  \
  cmake \
  flex \
  git g++ \
  libxml2-dev libmagic-dev libsndfile-dev libreadline-dev libucommon-dev libccrtp-dev libasound2-dev \
  qtbase5-dev qttools5-dev qtdeclarative5-dev qml-module-qtquick*

WORKDIR /app

RUN git clone https://github.com/LubosD/twinkle /app/twinkle

RUN cd /app/twinkle && mkdir -p build && cd build && \
  cmake ../ && \
  make -k -j4 && \
  make install

# run with :
# -it                                     # interactive
# -v /home/master/.twinkle:/root/.twinkle # conf file
# -v /tmp/.X11-unix:/tmp/.X11-unix \      # mount the X11 socket
# -e DISPLAY="unix$DISPLAY" \               # pass the display

  # -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
  # -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
  # -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
  # --group-add $(getent group audio | cut -d: -f3) \

# --device /dev/snd \                     # sound
#
# troublshooting
#
# if error : "QXcbConnection: Could not connect to display unix:0"
# run xhost +
CMD twinkle

# build twinkle
