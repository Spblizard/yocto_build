FROM ubuntu:20.04

ARG DEBIAN_FRONTED=noninteractive

ENV TZ Europe/Moscow
ENV TERM xterm

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt update && apt install -y asciidoc autoconf automake bc build-essential chrpath coreutils cpio curl \
    cvs debianutils desktop-file-utils diffstat docbook-utils dos2unix mtd-utils  g++ gawk gcc gcc-multilib \
    git groff help2man  iputils-ping libarchive-dev libelf-dev libgl1-mesa-dev libglib2.0-dev git-lfs \
    libglu1-mesa-dev liblz4-tool libncurses5 libncurses5-dev libncursesw5-dev libsdl1.2-dev libtool locales \
    lzop make mc mercurial pv python python3-git python-pysqlite2 python3 python3-pexpect python3-pip rename \
    sed socat subversion texi2html texinfo tmux u-boot-tools unzip vim wget xterm xz-utils zlib1g-dev zstd screen \
    net-tools iproute2 sudo libyaml-dev libssl-dev libgnutls28-dev iptables uml-utilities
	
RUN groupadd -g 1000 dev \
            && useradd -u 1000 -g dev -d /home/dev dev \
            && mkdir /home/dev \
            && chown -R dev:dev /home/dev
RUN usermod -aG sudo dev

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

USER dev

WORKDIR /home/dev


