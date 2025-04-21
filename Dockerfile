FROM debian:11.11

ARG USER_ID=501
ARG GROUP_ID=20
ARG USERNAME=devuser
ARG GROUPNAME=devgroup

# disable interactive prompts
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install wget vim x11-apps python3 pip3

# for praat
RUN  apt install -y libc++1      # the C++ standard library
RUN  apt install -y libgtk-3-0   # the graphics toolkit
RUN  apt install -y libpulse0    # the Pulse audio server
RUN  apt install -y libasound2   # the ALSA audio library
RUN  apt install -y libjack0     # the Jack audio library
RUN  apt install -y libcanberra-gtk-module     # needed only if your system complains about missing this
RUN apt install fonts-sil-charis # optional, but recommended
RUN apt install fonts-sil-doulos # optional, but recommended

# 指定されたGIDでグループを作成 (既に存在する場合は無視)
RUN groupadd -g $GROUP_ID $GROUPNAME || true

RUN useradd --create-home --no-log-init -u $USER_ID -g $GROUP_ID -s /bin/bash $USERNAME

# 作業ディレクトリをユーザーのホームディレクトリに設定
WORKDIR /home/$USERNAME

# コンテナのデフォルトユーザーをここで作成したユーザーに設定
USER $USERNAME

# コンテナ起動時のデフォルトコマンド (例: bash起動)
# docker-compose.yaml で上書き可能
CMD ["/bin/bash"]
