# Kali docker
This is my Kali Linux setup for Bug Bounty and CTFs.

I used to use a VM with Vagrant, you can find it in the `vagrant` branch.
I've moved to Docker because I've always found myself using Kali via SSH, so I
figured I could switch and only use graphical tools on my machine.

## Usage
You can pull the latest build from Docker Hub with:
```
$ docker pull samirettali/kali
```

Or you can clone the repository and build the image with:
```
$ docker build -t kali .
```

Run it:
```
$ docker run --rm -it kali-ctf bash
```

# Notes
## GUI tools on my machine
* [Burp suite](https://portswigger.net/burp): needs no introduction
* [Wireshark](https://www.wireshark.org/): same as above
* [Audacity](https://www.audacityteam.org/): for audio stuff and signals
* [Hex fiend](https://ridiculousfish.com/hexfiend/): MacOS hex editor
* [Beyound compare](https://www.scootersoftware.com/): really powerful file
* comparison

## Browser extensions
I use Google Chrome, with these extensions:

* [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm): Toolbar with various web tools
* [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg): Cookie editing
* [SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif): Switch between various proxies
* [User-Agent Switcher for Chrome](https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg): Switch between user agents
* [Wappalizer](https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg): Analyze web applications
* [Enhanced Image Viewer](https://chrome.google.com/webstore/detail/enhanced-image-viewer/gefiaaeadjbmhjndnhedfccdjjlgjhho)
* [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en)

These are the equivalent for Mozilla Firefox:
* [Web Developer](https://addons.mozilla.org/it/firefox/addon/web-developer/): Toolbar with various web tools
* [Cookie Manager](https://addons.mozilla.org/it/firefox/addon/cookie-quick-manager/): Cookie editing
* [SwitchyOmega](https://addons.mozilla.org/it/firefox/addon/switchyomega/?src=search): Switch between various proxies
* [User Agent Switcher](https://addons.mozilla.org/it/firefox/addon/uaswitcher/?src=search): Switch between user agents
* [Wappalizer](https://addons.mozilla.org/it/firefox/addon/wappalyzer/): Analyze web applications
* [BuiltWith](https://addons.mozilla.org/it/firefox/addon/builtwith/): Similar to Wappalizer
* [Enhanced Image Viewer](https://addons.mozilla.org/it/firefox/addon/sblask-enhanced-image-viewer/)
* [DotGit](https://addons.mozilla.org/it/firefox/addon/dotgit/)
* [Hack Tools](https://addons.mozilla.org/it/firefox/addon/hacktools/)
* [PwnFox](https://addons.mozilla.org/it/firefox/addon/pwnfox/)

## Online tools

### Cryptography
* [Boxentrix](https://www.boxentriq.com/code-breaking)
* [Cipher tools](http://rumkin.com/tools/cipher)
* [Cryptii](https://cryptii.com)
* [Integer factorization](jjalpertron.com.ar/ECM.HTM)
* [dcode.fr](https://www.dcode.fr/tools-list)
* [factordb.com](http://factordb.com)

### Regexes
* [regex101](https://regex101.com)
* [Debuggex](https://www.debuggex.com)

### Execute code
* [tio.run](https://tio.run)
* [.NETFiddle](https://dotnetfiddle.net)

### Command tools
* [crontab.guru](https://crontab.guru)
* [curl-to-Go](https://mholt.github.io/curl-to-go)
* [curlbuilder](https://curlbuilder.com)

### Exploitation
* [Sploitus](https://sploitus.com)
* [cve-mitre](https://cve.mitre.org)
* [exploit-db](https://www.exploit-db.com)
* [onegadget.me](https://onegadget.me/)

### Cracking
* [CrackStation](https://crackstation.net)
* [HashKiller](https://hashkiller.co.uk)
* [OnlineHashCrack](https://www.onlinehashcrack.com)
* [Quipquip](https://quipqiup.com)

### Endpoint creation
* [Beeceptor](https://beeceptor.com)
* [Hookbin](https://hookbin.com)
* [Requestbin](https://requestbin.com/)
* [Webhook](https://webhook.site)
* [dnsbin](http://dnsbin.zhack.ca)
* [pinbin](http://pingb.in)

### Web stuff
* [CachedView](https://cachedview.com)
* [guballa](https://www.guballa.de/substitution-solver)
* [jwt.io](https://jwt.io)
* [csp-evaluator](https://csp-evaluator.withgoogle.com/)

### CTF related
* [CTF Search](https://ctf.courgettes.club)
* [IPPSEC](https://ippsec.rocks)

### Misc
* [CyberChef](https://gchq.github.io/CyberChef)
* [ShellStorm](http://shell-storm.org/shellcode)
* [Virustotal](https://www.virustotal.com/gui/home)
* [OSINT Framework](https://osintframework.com/)
* [Diffchecker](https://www.diffchecker.com/)
* [OCR](https://www.onlineocr.net/it/)

### Resources:
* [GTFOBins](https://gtfobins.github.io/)
* [LOLBAS](https://lolbas-project.github.io/)
* [Identify a cipher](http://practicalcryptography.com/cryptanalysis/text-characterisation/identifying-unknown-ciphers/)
* [List of magic numbers](https://en.wikipedia.org/wiki/List_of_file_signatures)
* [Reverse shells cheatsheet](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)
* [System calls](http://shell-storm.org/shellcode/files/syscalls.html)

### Steganography:
* [Unicode steganography ](https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder)
* [Unicode zero-width steganography](https://330k.github.io/misc_tools/unicode_steganography.html)
* [Translate audio to raw image](https://rawpixels.net/)

## Windows tools
These are the tools that I use on my Windows 10 VM (it's separate from this
project, it's just for having a reference)

### Misc
* [7zip](https://www.7-zip.org/)
* [Chrome](https://www.google.com/intl/chrome/)
* [Cygwin](https://www.cygwin.com/)
* [Firefox](https://www.mozilla.org/firefox)
* [HxD](https://mh-nexus.de/en/hxd/)
* [OpenVPN](https://openvpn.net/)
* [VS Code](https://code.visualstudio.com/)
* [Visual Studio](https://visualstudio.microsoft.com/i)
* [hashcalc](https://www.slavasoft.com/hashcalc/)
* [putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
* [Malzilla](http://malzilla.sourceforge.net/)
* [NBTExplorer](https://github.com/jaquadro/NBTExplorer)

### Forensics
* [Regshot](https://sourceforge.net/projects/regshot/)

### Process analysis
* [Procdump](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump)
* [Process Monitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon)
* [Process hacker](https://processhacker.sourceforge.io/)
* [nodeJS](https://nodejs.org/)
* [API monitor](https://www.rohitab.com/apimonitor)

### Network
* [Burp suite](https://portswigger.net/burp)
* [Fiddler](https://www.telerik.com/fiddler)
* [Network monitor](https://www.microsoft.com/en-us/download/details.aspx?id=4865)
* [Wireshark](https://www.wireshark.org/)
* [DNS query sniffer](https://www.nirsoft.net/utils/dns_query_sniffer.html)
* [TCP log viewer](https://www.nirsoft.net/utils/tcp_log_view.html)

### Reversing
* [Ghidra](https://ghidra-sre.org/)
* [IDA](https://www.hex-rays.com/products/ida/support/download_freeware.shtml)
* [PE-Bear](https://hshrzd.wordpress.com/pe-bear/)
* [PPEE (Professional PE explorer)](https://www.mzrst.com/)
* [dnSpy](https://github.com/0xd4d/dnSpy)
* [scdbg](http://sandsprite.com/blogs/index.php?uid=7&pid=152)
* [x64dbg](https://x64dbg.com/)
* [CMD watcher](https://www.kahusecurity.com/tools.html)
* [Dependency walker](http://www.dependencywalker.com/)
* [PEStudio](https://www.winitor.com/get.html)
* [Resource hacker](http://www.angusj.com/resourcehacker/)
* [BinText](https://www.aldeid.com/wiki/BinText)
* [SSView](https://www.mitec.cz/ssv.html)
* [CFF Explorer](https://ntcore.com/?page_id=388)
