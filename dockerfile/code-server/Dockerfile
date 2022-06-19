FROM codercom/code-server:latest

USER root
ENV USER=root
WORKDIR /root

ARG DEV_LANG=cpp

RUN { \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free"; \
        echo "deb https://mirrors.bfsu.edu.cn/debian/ bullseye main contrib non-free"; \
        echo "deb https://mirrors.bfsu.edu.cn/debian/ bullseye-updates main contrib non-free"; \
        echo "deb https://mirrors.bfsu.edu.cn/debian/ bullseye-backports main contrib non-free"; \
        echo "deb https://mirrors.bfsu.edu.cn/debian-security bullseye-security main contrib non-free"; \
    } > /etc/apt/sources.list \
      && \ 
    apt-get update -y && apt-get install -f -y \
        apt-transport-https ca-certificates \
        git vim-common \
      && \
    { \
      [[ x"${DEV_LANG}" = x'cpp'    ]] && echo " gcc g++ clang cmake make gdb "; \
      [[ x"${DEV_LANG}" = x'java17' ]] && echo " openjdk-17-jdk maven gradle "; \
      [[ x"${DEV_LANG}" = x'node'   ]] && echo " nodejs npm "; \
      [[ x"${DEV_LANG}" = x'python' ]] && echo " pip "; \
      [[ x"${DEV_LANG}" = x'golang' ]] && echo " golang "; \
    } | xargs apt-get install -y \
      && \
    apt-get autoremove -y && apt-get autoclean -y \
      && \
    rm -rf /var/lib/apt/lists/ \
      && \
    chsh -s /usr/bin/zsh