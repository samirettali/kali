FROM kalilinux/kali-bleeding-edge

ARG USER=user
ARG PASSWD=password
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# Base tools
RUN apt-get install --no-install-recommends -y \
    ack curl dnsutils dos2unix entr fd-find file fzf git \
    hexedit jq less man moreutils openssh-client python3 python3-pip sudo tmux \
    tree vim watch wget

# Development tools
RUN apt-get install --no-install-recommends -y \
    build-essential default-jdk-headless golang php-cli python3-dev ruby-dev

# Reversing
RUN apt-get install --no-install-recommends -y \
    apktool dex2jar gdb ltrace radare2 strace

# Forensics
RUN apt-get install --no-install-recommends -y \
    binwalk exiftool foremost pngcheck steghide volatility

# Exploiting
RUN apt-get install --no-install-recommends -y \
    exploitdb metasploit-framework

# Web tools
RUN apt-get install --no-install-recommends -y \
    nikto sqlmap whatweb

# Networking
RUN apt-get install --no-install-recommends -y \
    hydra iputils-ping ncat nmap tshark whois

# Misc
RUN apt-get install --no-install-recommends -y \
    cewl john rlwrap sqlite3 zbar-tools

# Windows stuff
RUN apt-get install --no-install-recommends -y \
    cifs-utils crackmapexec ldap-utils samdump2 smbclient smbmap

# Python tools
RUN pip3 install aclpwn gsan oletools pwntools stegcracker stegoveritas

# Ruby tools
RUN gem install evil-winrm zsteg

# Go tools
RUN go get github.com/ffuf/ffuf \
           github.com/hakluke/hakrawler \
           github.com/lc/gau \
           github.com/tomnomnom/hacks/html-tool && \
    mv /root/go/bin/* /bin


# RUN service postgresql start
# RUN msfdb init

RUN stegoveritas_install_deps
RUN curl -s https://github.com/lukechampine/jsteg/releases/download/v0.3.0/jsteg-darwin-amd64 -o /bin/jsteg

# User creation
RUN useradd -m ${USER} && \
    usermod -aG sudo ${USER} && \
    echo "${USER}:${PASSWD}" | chpasswd && \
    chsh -s /bin/bash ${USER} && \
    chown -R ${USER}:${USER} /home/${USER}

USER $USER

# Install gef
RUN curl -Ls https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Install dotfiles
RUN curl -Ls http://bit.do/samirminimaldotfiles | bash

WORKDIR /home/${USER}
