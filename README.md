# Kali docker
This is my Kali Linux setup for Bug Bounty and CTFs.

I used to use a VM with Vagrant, you can find it in the `vagrant` branch. I've moved to Docker because I've always found myself using Kali via SSH, so I figured I could switch and only use graphical tools on my machine.

There are two versions:
* A small base image that I use daily, mainly for web testing
* A CTF image that extends the base image, adding tools for things like steganograpy or forensics

## Usage
You can always pull the latest build from Docker Hub with:
```
$ docker pull samirettali/kali
```

Or if you want the CTF version:
```
$ docker pull samirettali/kali:ctf
```

Run it:
```
$ docker run --rm -it kali
```

If you prefer, you can clone the repository and build the image yourself.

When you start a container for the first time you will be prompted if you want to download some wordlists and install my dotfiles, I did it so that I don't have to do it manually each time I update the container and so that if someone else wants to use it he can use it without having my configurations installed.

## Notes

There are some graphical tools that I use on my machine:

* [Burp suite](https://portswigger.net/burp): needs no introduction
* [Wireshark](https://www.wireshark.org/): same as above
* [GraphQL Playground](https://github.com/graphql/graphql-playground): Testing
    GraphQL APIs
* [Audacity](https://www.audacityteam.org/): Audio and signal analysis
* [Hex fiend](https://ridiculousfish.com/hexfiend/): MacOS hex editor
* [Beyond compare](https://www.scootersoftware.com/): really powerful file
  comparison
* [Recaf](https://github.com/Col-E/Recaf): Java bytecode editor
* [Sonic visualizer](https://www.sonicvisualiser.org/): Visualize and analyse
    audio
* [FLDigi](http://www.w1hkj.com/): Signal decoding

<!-- ## Online tool -->

<!-- ### Cryptography -->
<!-- * [Boxentrix](https://www.boxentriq.com/code-breaking) -->
<!-- * [Cipher tools](http://rumkin.com/tools/cipher) -->
<!-- * [Cryptii](https://cryptii.com) -->
<!-- * [Integer factorization](jjalpertron.com.ar/ECM.HTM) -->
<!-- * [dcode.fr](https://www.dcode.fr/tools-list) -->
<!-- * [factordb.com](http://factordb.com) -->

<!-- ### Execute code -->
<!-- * [tio.run](https://tio.run) -->
<!-- * [.NETFiddle](https://dotnetfiddle.net) -->

<!-- ### Cracking -->
<!-- * [Quipquip](https://quipqiup.com) -->
<!-- * [guballa](https://www.guballa.de/substitution-solver) -->

<!-- ### CTF related -->
<!-- * [CTF Search](https://ctf.courgettes.club) -->
<!-- * [IPPSEC](https://ippsec.rocks) -->

<!-- ### Misc -->
<!-- * [ShellStorm](http://shell-storm.org/shellcode) -->
<!-- * [Diffchecker](https://www.diffchecker.com/) -->
<!-- * [OCR](https://www.onlineocr.net/it/) -->
<!-- * [Related words](https://relatedwords.org/) -->

<!-- ### Resources: -->
<!-- * [GTFOBins](https://gtfobins.github.io/) -->
<!-- * [LOLBAS](https://lolbas-project.github.io/) -->
<!-- * [Identify a cipher](http://practicalcryptography.com/cryptanalysis/text-characterisation/identifying-unknown-ciphers/) -->
<!-- * [List of magic numbers](https://en.wikipedia.org/wiki/List_of_file_signatures) -->
<!-- * [Reverse shells cheatsheet](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet) -->
<!-- * [System calls](http://shell-storm.org/shellcode/files/syscalls.html) -->

<!-- ### Steganography: -->
<!-- * [Unicode steganography ](https://www.irongeek.com/i.php?page=security/unicode-steganography-homoglyph-encoder) -->
<!-- * [Unicode zero-width steganography](https://330k.github.io/misc_tools/unicode_steganography.html) -->
<!-- * [Translate audio to raw image](https://rawpixels.net/) -->

<!-- ## Windows tools -->
<!-- These are the tools that I use on my Windows 10 VM (it's separate from this -->
<!-- project, it's just for having a reference) -->

<!-- ### Misc -->
<!-- * [7zip](https://www.7-zip.org/) -->
<!-- * [Chrome](https://www.google.com/intl/chrome/) -->
<!-- * [Cygwin](https://www.cygwin.com/) -->
<!-- * [Firefox](https://www.mozilla.org/firefox) -->
<!-- * [HxD](https://mh-nexus.de/en/hxd/) -->
<!-- * [OpenVPN](https://openvpn.net/) -->
<!-- * [VS Code](https://code.visualstudio.com/) -->
<!-- * [Visual Studio](https://visualstudio.microsoft.com/i) -->
<!-- * [hashcalc](https://www.slavasoft.com/hashcalc/) -->
<!-- * [putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) -->
<!-- * [Malzilla](http://malzilla.sourceforge.net/) -->
<!-- * [NBTExplorer](https://github.com/jaquadro/NBTExplorer) -->

<!-- ### Forensics -->
<!-- * [Regshot](https://sourceforge.net/projects/regshot/) -->

<!-- ### Process analysis -->
<!-- * [Procdump](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump) -->
<!-- * [Process Monitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon) -->
<!-- * [Process hacker](https://processhacker.sourceforge.io/) -->
<!-- * [nodeJS](https://nodejs.org/) -->
<!-- * [API monitor](https://www.rohitab.com/apimonitor) -->

<!-- ### Network -->
<!-- * [Burp suite](https://portswigger.net/burp) -->
<!-- * [Fiddler](https://www.telerik.com/fiddler) -->
<!-- * [Network monitor](https://www.microsoft.com/en-us/download/details.aspx?id=4865) -->
<!-- * [Wireshark](https://www.wireshark.org/) -->
<!-- * [DNS query sniffer](https://www.nirsoft.net/utils/dns_query_sniffer.html) -->
<!-- * [TCP log viewer](https://www.nirsoft.net/utils/tcp_log_view.html) -->

<!-- ### Reversing -->
<!-- * [Ghidra](https://ghidra-sre.org/) -->
<!-- * [IDA](https://www.hex-rays.com/products/ida/support/download_freeware.shtml) -->
<!-- * [PE-Bear](https://hshrzd.wordpress.com/pe-bear/) -->
<!-- * [PPEE (Professional PE explorer)](https://www.mzrst.com/) -->
<!-- * [dnSpy](https://github.com/0xd4d/dnSpy) -->
<!-- * [scdbg](http://sandsprite.com/blogs/index.php?uid=7&pid=152) -->
<!-- * [x64dbg](https://x64dbg.com/) -->
<!-- * [CMD watcher](https://www.kahusecurity.com/tools.html) -->
<!-- * [Dependency walker](http://www.dependencywalker.com/) -->
<!-- * [PEStudio](https://www.winitor.com/get.html) -->
<!-- * [Resource hacker](http://www.angusj.com/resourcehacker/) -->
<!-- * [BinText](https://www.aldeid.com/wiki/BinText) -->
<!-- * [SSView](https://www.mitec.cz/ssv.html) -->
<!-- * [CFF Explorer](https://ntcore.com/?page_id=388) -->
