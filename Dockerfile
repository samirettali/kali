FROM samirettali/kali

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install --no-install-recommends -y ruby

# Reversing and binary exploitation
RUN pip3 install oletools
RUN pip3 install angr
RUN pip3 install uncompyle6
RUN pip3 install pwntools
RUN apt-get install --no-install-recommends -y gdb
RUN apt-get install --no-install-recommends -y radare2
RUN apt-get install --no-install-recommends -y ltrace
RUN apt-get install --no-install-recommends -y strace
RUN apt-get install --no-install-recommends -y apktool
RUN apt-get install --no-install-recommends -y dex2jar
RUN apt-get install --no-install-recommends -y exploitdb
RUN apt-get install --no-install-recommends -y metasploit-framework
RUN curl -Ls https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Forensics
RUN apt-get install --no-install-recommends -y hexedit
RUN apt-get install --no-install-recommends -y binwalk
RUN apt-get install --no-install-recommends -y exiftool
RUN apt-get install --no-install-recommends -y foremost
RUN apt-get install --no-install-recommends -y pngcheck
RUN apt-get install --no-install-recommends -y unar

# Cracking and bruteforcing
RUN pip3 install ciphey
RUN apt-get install --no-install-recommends -y john
RUN apt-get install --no-install-recommends -y hashcat
RUN apt-get install --no-install-recommends -y hydra

# Windows stuff
RUN pi3 install aclpwn
RUN gem install evil-winrm
RUN apt-get install --no-install-recommends -y cifs-utils
RUN apt-get install --no-install-recommends -y crackmapexec
RUN apt-get install --no-install-recommends -y ldap-utils
RUN apt-get install --no-install-recommends -y samdump2
RUN apt-get install --no-install-recommends -y smbclient
RUN apt-get install --no-install-recommends -y smbmap

# Steganography
RUN pip3 intall stegcracker
RUN pip3 intall stegoveritas
RUN apt-get install -y steghide

# RUN service postgresql start
# RUN msfdb init
