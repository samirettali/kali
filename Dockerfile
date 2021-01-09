FROM kalilinux/kali-bleeding-edge

ARG USER=root
# ARG PASSWD=pwd
ENV DEBIAN_FRONTEND noninteractive

# Update repositories and upgrade software
RUN apt-get update && apt-get upgrade -y

# Base tools
RUN apt-get install --no-install-recommends -y \
    awscli curl dnsutils dos2unix entr fd-find file fzf git hexedit jq \
    less man moreutils ncdu openssh-client python3 python3-pip ripgrep tmux tree
    neovim watch wget

# Development tools
RUN apt-get install --no-install-recommends -y \
    build-essential default-jdk-headless golang php-cli python3-dev ruby-dev nodejs npm cargo

# Reversing
RUN apt-get install --no-install-recommends -y \
    apktool dex2jar gdb ltrace radare2 strace

# Forensics
RUN apt-get install --no-install-recommends -y \
    binwalk exiftool foremost pngcheck steghide unar

# Exploiting
RUN apt-get install --no-install-recommends -y \
    exploitdb metasploit-framework

# Craking 
RUN apt-get install --no-install-recommends -y john hashcat

# Bruteforcing
RUN apt-get install --no-install-recommends -y hydra

# Networking
RUN apt-get install --no-install-recommends -y iputils-ping ncat nmap socat tshark whois

# Wordlist creation
RUN apt-get install --no-install-recommends -y cewl

# Web tools
RUN apt-get install --no-install-recommends -y nikto sqlmap whatweb

# Subdomain enumeration
RUN apt-get install --no-install-recommends -y amass dnsrecon

# Misc
RUN apt-get install --no-install-recommends -y sqlite3 zbar-tools

# Windows stuff
RUN apt-get install --no-install-recommends -y \
    cifs-utils crackmapexec ldap-utils samdump2 smbclient smbmap

# Web enumeration
RUN gem install XSpear
RUN pip3 install shodan
RUN apt-get install --no-install-recommends -y whois

RUN mkdir -p /usr/share/wordlists

# RUN service postgresql start
# RUN msfdb init

# Python tools
RUN pip3 install aclpwn angr ciphey oletools pwntools stegcracker \
    stegoveritas uncompyle6

# Ruby tools
RUN gem install evil-winrm zsteg

RUN stegoveritas_install_deps
RUN curl -s https://github.com/lukechampine/jsteg/releases/download/v0.3.0/jsteg-darwin-amd64 -o /bin/jsteg

# Install findomain
RUN wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux -O /usr/local/bin/findomain && \
        chmod +x /usr/local/bin/findomain

# Install altdns
RUN git clone https://github.com/infosec-au/altdns && \
        cd altdns && \
        python3 setup.py install && \
        cd .. && \
        rm -rf altdns

# Install dnsgen
RUN git clone https://github.com/ProjectAnte/dnsgen && \
        cd dnsgen && \
        pip3 install -r requirements.txt && \
        python3 setup.py install && \
        cd .. && \
        rm -rf dnsgen

# Install dnscewl
RUN git clone https://github.com/codingo/DNSCewl && \
        cd DNSCewl && \
        make && \
        mv DNScewl /usr/local/bin/dnscewl && \
        cd .. && \
        rm -rf DNSCewl

# Install massdns
RUN git clone https://github.com/blechschmidt/massdns && \
        cd massdns && \
        make && \
        make install && \
        cp -r lists /usr/share/wordlists/massdns && \
        cd .. && \
        rm -rf massdns

# Install dnsvalidator
RUN git clone https://github.com/vortexau/dnsvalidator  && \
        cd dnsvalidator && \
        python3 setup.py install && \
        cd .. && \
        rm -rf dnsvalidator

# Install masscan
RUN apt-get install -y --no-install-recommends gcc make libpcap-dev && \
        git clone https://github.com/robertdavidgraham/masscan && \
        cd masscan && \
        make && \
        mv bin/masscan /usr/local/bin && \
        cd .. && \
        rm -rf masscan

RUN mkdir -p /usr/bin

RUN git clone https://github.com/devanshbatham/FavFreak && \
    cd FavFreak && \
    pip3 install -r requirements.txt && \
    mv favfreak.py /usr/bin/favfreak && \
    cd .. && \
    rm -rf FavFreak

# Rust tools
cargo install feroxbuster

# Go tools
RUN GO111MODULE=on go get -v github.com/ffuf/ffuf \
    github.com/hakluke/hakrawler \
    github.com/lc/gau \
    github.com/tillson/git-hound \
    github.com/asciimoo/wuzz \
    github.com/haccer/subjack \
    github.com/003random/getJS \
    github.com/milindpurswani/whoxyrm \
    github.com/jaeles-project/jaeles \
    github.com/jaeles-project/gospider \
    github.com/dwisiswant0/crlfuzz/cmd/crlfuzz \
    github.com/Static-Flow/ParameterMiner/cmd/parameterMiner \
    github.com/projectdiscovery/nuclei/v2/cmd/nuclei \
    github.com/projectdiscovery/naabu/v2/cmd/naabu \
    github.com/projectdiscovery/httpx/cmd/httpx \
    github.com/projectdiscovery/proxify/cmd/proxify \
    github.com/projectdiscovery/chaos-client/cmd/chaos \
    github.com/projectdiscovery/subfinder/v2/cmd/subfinder \
    github.com/projectdiscovery/shuffledns/cmd/shuffledns \
    github.com/projectdiscovery/dnsx/cmd/dnsx \
    github.com/projectdiscovery/mapcidr/cmd/mapcidr \
    github.com/dwisiswant0/unew \
    github.com/tomnomnom/assetfinder \
    github.com/tomnomnom/gf \
    github.com/tomnomnom/meg \
    github.com/tomnomnom/httprobe \
    github.com/tomnomnom/unfurl \
    github.com/tomnomnom/anew \
    github.com/tomnomnom/waybackurls \
    github.com/tomnomnom/qsreplace \
    github.com/tomnomnom/hacks/kxss \
    github.com/tomnomnom/hacks/tok \
    github.com/tomnomnom/hacks/ettu \
    github.com/tomnomnom/hacks/filter-resolved \
    github.com/tomnomnom/hacks/html-tool
RUN mv /root/go/bin/* /usr/local/bin && rm -rf /root/go

# Install ngrok
RUN curl -s https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip | \
        zcat > /usr/local/bin/ngrok && \
        chmod +x /usr/local/bin/ngrok

# Install linkfinder dependencies
RUN git clone https://github.com/GerbenJavado/LinkFinder && \
        cd LinkFinder && \
        pip3 install -r requirements.txt && \
        cd .. && \
        rm -rf LinkFinder

# Install ParamSpider dependencies
RUN git clone https://github.com/devanshbatham/ParamSpider && \
        cd ParamSpider && \
        pip3 install -r requirements.txt && \
        cd .. && \
        rm -rf ParamSpider

# Install surge to host static websites
RUN npm install -global surge

# Get gf's patterns
RUN cd /root && \
        git clone https://github.com/tomnomnom/gf && \
        mkdir -p /root/.gf && \
        mv gf/examples/*.json /root/.gf && \
        rm -rf gf

RUN cd /root && \
        git clone https://github.com/1ndianl33t/Gf-Patterns && \
        mkdir -p /root/.gf && \
        mv Gf-Patterns/*.json /root/.gf && \
        rm -rf Gf-Patterns

# Get jaeles' signatures
RUN cd /root && \
        git clone --depth=1 https://github.com/jaeles-project/jaeles-signatures && \
        jaeles config -a reload --signDir jaeles-signatures && \
        rm -rf jaeles-signatures

# Install gef
RUN curl -Ls https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

WORKDIR /root
