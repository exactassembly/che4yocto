FROM eclipse/ubuntu_jre

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

# Install Core packages
RUN sudo apt-get update && \
    sudo apt-get -y install \
        netcat apt-utils sed rsync gawk cpio chrpath \
        make build-essential gcc-multilib libtool autoconf automake \
        cvs subversion git-core quilt diffstat libssl-dev \
        vim srecord texinfo procps net-tools screen ncurses-dev \
        nano smartpm rpm python-rpm vim srecord hexedit libsdl-dev && \
    sudo apt-get -y clean && \
    sudo apt-get -y autoremove -y && \
    sudo rm -rf /var/lib/apt/lists/*

# Configure timezone and locale
#RUN echo "UTC" > /etc/timezone && \
#	dpkg-reconfigure -f noninteractive tzdata

WORKDIR /projects

CMD tail -f /dev/null
