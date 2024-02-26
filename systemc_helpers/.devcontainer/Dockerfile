FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]

# to silence some apt-get warnings
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NOWARNINGS="yes"

ARG USERNAME=devel
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && apt-get install -y --no-install-recommends dialog apt-utils

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN sudo apt-get update -y && sudo apt-get upgrade -y

# useful packages
RUN sudo apt-get install -y bash-completion wget curl ca-certificates

# git and github cli
RUN sudo apt-get install -y git
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt-get -y update \
    && sudo apt-get -y install gh

# verilator dependencies
RUN sudo apt-get install -y \
    git help2man perl python3 make autoconf g++ flex bison ccache \
    libgoogle-perftools-dev numactl perl-doc \
    libfl2 libfl-dev \
    zlib1g zlib1g-dev

RUN sudo apt-get install -y \
    build-essential \
    g++ \
    gcc \
    g++-12 \
    gcc-12 \
    gdb \
    python3 \
    python3-dev \
    python3-pip \
    ninja-build \
    cmake \
    make \
    strace \
    valgrind \
    libboost-all-dev \
    libfmt-dev

# totally optional, I like to have a nice command prompt
RUN (cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install 2> /dev/null) && source /home/$USERNAME/.bashrc

# install conda
ENV CONDA_DIR=/home/$USERNAME/miniconda
RUN mkdir -p /home/$USERNAME/Downloads
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/$USERNAME/Downloads/miniconda.sh && \
    /bin/bash /home/$USERNAME/Downloads/miniconda.sh -b -p /home/$USERNAME/miniconda
RUN eval "$(/home/devel/miniconda/bin/conda shell.bash hook)" \
    && conda create -n hwdev python=3.9 \
    && echo "$(/home/devel/miniconda/bin/conda shell.bash hook)" >> /home/$USERNAME/.bashrc \
    && echo "conda activate hwdev" >> /home/$USERNAME/.bashrc

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

# note: we should first do `RUN mkdir -p $dir` and then `WORKDIR $dir`
# otherwise, the directory is created as the root user

# install SystemC
RUN mkdir -p /home/$USERNAME/repos/accellera-official
WORKDIR /home/$USERNAME/repos/accellera-official
RUN git clone https://github.com/accellera-official/systemc.git
RUN mkdir -p /home/$USERNAME/repos/accellera-official/systemc/build-release
WORKDIR /home/$USERNAME/repos/accellera-official/systemc/build-release
RUN git checkout 2.3.3
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=20 -G Ninja -DCMAKE_INSTALL_PREFIX=/usr/local
RUN ninja
RUN sudo ninja install

# install Verilator
RUN mkdir -p /home/$USERNAME/repos/verilator
WORKDIR /home/$USERNAME/repos/verilator
RUN git clone https://github.com/verilator/verilator.git
RUN mkdir -p /home/$USERNAME/repos/verilator/verilator/build-release
WORKDIR /home/$USERNAME/repos/verilator/verilator/build-release
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=20 -G Ninja -DCMAKE_INSTALL_PREFIX=/usr/local
RUN ninja
RUN sudo ninja install

# clone the Xilinx SoC repository
RUN mkdir -p /home/$USERNAME/repos/Xilinx
WORKDIR /home/$USERNAME/repos/Xilinx
RUN git clone https://github.com/Xilinx/libsystemctlm-soc

# clean up the image
RUN rm -rf /home/$USERNAME/repos/accellera-official/systemc/build-release
RUN rm -rf /home/$USERNAME/repos/verilator/verilator/build-release

RUN mkdir -p /home/$USERNAME/.local/include
WORKDIR /home/$USERNAME/.local/include
RUN ln -s /home/$USERNAME/repos/Xilinx/libsystemctlm-soc

# Install sbt and OpenJDK
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
RUN sudo apt-get update && sudo apt-get install -y sbt openjdk-17-jdk

WORKDIR /home/$USERNAME

ENV SYSTEMC_INCLUDE="/usr/local/include"
ENV SYSTEMC_LIBDIR="/usr/local/lib"
ENV VERILATOR_ROOT="/usr/local"
ENV XILINX_SYSTEMC_INCLUDE="/root/.local/include"
