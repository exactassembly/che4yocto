FROM eclipse/ubuntu_jre

# Install Core packages
RUN sudo apt-get update && \
    sudo apt-get -y install \
        netcat apt-utils sed rsync gawk wget curl unzip sudo cpio chrpath \
        make build-essential gcc-multilib libtool autoconf automake \
        cvs subversion git-core quilt diffstat libssl-dev \
        vim srecord texinfo procps net-tools screen ncurses-dev \
        nano smartpm rpm python-rpm vim srecord hexedit ssh-client libsdl-dev && \
    sudo apt-get clean -y && \
    sudo apt-get autoremove -y && \
    sudo rm -rf /var/lib/apt/lists/*

# Configure timezone and locale
#RUN echo "UTC" > /etc/timezone && \
#	dpkg-reconfigure -f noninteractive tzdata

WORKDIR /projects

CMD tail -f /dev/null
