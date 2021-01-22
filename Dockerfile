FROM golang:alpine as builder

RUN apk add --no-cache git

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN go get github.com/projectdiscovery/dnsx/cmd/dnsx
RUN go get github.com/haccer/subjack
# waiting for PR
# RUN go get -u github.com/lc/subjs
RUN go get -u github.com/virenpawar/subjs
RUN go get github.com/tomnomnom/hacks/concurl
RUN go get github.com/tomnomnom/gron
RUN go get github.com/projectdiscovery/httpx/cmd/httpx
RUN go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei
# RUN go get -u github.com/projectdiscovery/naabu/v2/cmd/naabu
RUN go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder@dev
RUN go get github.com/tomnomnom/meg
RUN go get github.com/tomnomnom/qsreplace
RUN go get github.com/tomnomnom/unfurl
RUN go get github.com/tomnomnom/hacks/kxss
RUN go get github.com/tomnomnom/waybackurls
RUN go get github.com/tomnomnom/assetfinder
RUN go get github.com/lc/gau
RUN go get github.com/tomnomnom/hacks/tok
# RUN go get github.com/michenriksen/aquatone
RUN go get github.com/ffuf/ffuf
RUN go get github.com/OWASP/Amass/v3/...
RUN go get -u github.com/jaeles-project/gospider
RUN go get -u github.com/tomnomnom/gf

FROM kalilinux/kali-bleeding-edge

COPY --from=builder /go/bin/* /usr/bin/

ENV DEBIAN_FRONTEND noninteractive

# Install software
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends nmap
RUN apt-get install -y --no-install-recommends python3
RUN apt-get install -y --no-install-recommends whois
RUN apt-get install -y --no-install-recommends python3-pip
RUN apt-get install -y --no-install-recommends awscli
RUN apt-get install -y --no-install-recommends jq
RUN apt-get install -y --no-install-recommends curl
RUN apt-get install -y --no-install-recommends neovim
RUN apt-get install -y --no-install-recommends git
RUN apt-get install -y --no-install-recommends tree
RUN apt-get install -y --no-install-recommends tmux
RUN apt-get install -y --no-install-recommends sqlmap
RUN apt-get install -y --no-install-recommends stow
RUN apt-get install -y --no-install-recommends zsh
RUN apt-get install -y --no-install-recommends ncat
RUN apt-get install -y --no-install-recommends rlwrap
RUN apt-get install -y --no-install-recommends moreutils
RUN apt-get install -y --no-install-recommends fzf
RUN apt-get install -y --no-install-recommends fd-find
RUN apt-get install -y --no-install-recommends man
RUN apt-get install -y --no-install-recommends openssh-client
RUN apt-get install -y --no-install-recommends iputils-ping
RUN apt-get install -y --no-install-recommends less


# Install gf patterns
RUN git clone https://github.com/tomnomnom/gf
RUN cp -r gf/examples /root/.gf
RUN rm -rf gf

RUN git clone https://github.com/1ndianl33t/Gf-Patterns
RUN mv Gf-Patterns/*.json /root/.gf

# RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb
# RUN apt-get install -y --no-install-recommends ./chrome.deb

RUN pip install myjwt
RUN pip install shodan

RUN curl -Ls https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux -o /usr/bin/findomain && chmod +x /usr/bin/findomain

# Install LinkFinder
RUN git clone https://github.com/GerbenJavado/LinkFinder.git
RUN cd LinkFinder && pip3 install -r requirements.txt && python3 setup.py install

RUN touch ~/.hushlogin

COPY ./entrypoint.sh /
COPY ./download-wordlists.sh /root

ENTRYPOINT ["/entrypoint.sh"]
