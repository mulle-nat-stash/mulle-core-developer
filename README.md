# mulle-core-developer

🧢  mulle-core developer kit for mulle-sde

Use `mulle-sde init -m mulle-core/c-developer` to create projects
that tap into the functionality of the following libraries:


Library                                                  | Description
---------------------------------------------------------|----------------------------
[mulle-aba](//github.com/mulle-concurrent/mulle-aba)     | Memory reclamation for concurrent algorithms
[mulle-allocator](//github.com/mulle-c/mulle-allocator)  | Memory allocation and leak checking
[mulle-buffer](//github.com/mulle-c/mulle-buffer)        | Memory storage and streams
[mulle-c11](//github.com/mulle-c/mulle-c11)              | Compiler glue
[mulle-concurrent](//github.com/mulle-concurrent/mulle-concurrent)| Concurrent hashtable and array
[mulle-container](//github.com/mulle-c/mulle-container)  | ObjC Foundation like data structures
[mulle-sprintf](//github.com/mulle-core/mulle-sprintf )  | Extensible sprintf
[mulle-testallocator](//github.com/mulle-core/mulle-testallocator)  | Leak and double free checking
[mulle-sprintf](//github.com/mulle-core/mulle-sprintf)   | Extensible sprintf
[mulle-thread](//github.com/mulle-concurrent/mulle-thread) | Threads and locks (C11/pthread)
[mulle-utf](//github.com/mulle-c/mulle-utf )             | Unicode string library
[mulle-vararg](//github.com/mulle-c/mulle-vararg )       | An alternative vararg scheme


This package will install the [mulle-sde](/github.com/mulle-sde/mulle-sde) and
[mulle-test](/github.com/mulle-sde/mulle-test) developer tools.


## Usage

Check that the (meta) extensions are found with `mulle-sde extension show`.


### Create an executable mulle-c project

`mulle-sde init -d hello-exe -m mulle-core/c-developer executable`

### Create a library mulle-c project

`mulle-sde init -d hello-lib -m mulle-core/c-developer library`



## Install

### Packages

OS      | Command
--------|------------------------------------
macos   | `brew install mulle-kybernetik/software/mulle-core-developer`
debian  | `sudo apt-get -y install mulle-core-developer` (but see below)
ubuntu  | same as debian


#### Debian Mulle kybernetiK repository

For apt installation you need to add the Mulle kybernetiK debian repository
first:

```
wget -O - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" | sudo apt-key add -
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" | sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
sudo apt-get update
```

### Script

mulle-sde provides an [installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all) script to install the required commands and mulle-sde-developer itself into `/usr` or some other place.
This is suitable for environments without supported package managers:

#### Install into /usr with sudo

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all /usr
```

#### Install into ${HOME} (without sudo)

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all' && \
chmod 755 installer-all && \
OTHER_PROJECTS="mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all ~ no
```

