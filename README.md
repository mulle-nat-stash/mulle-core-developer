# 🧢 Enhanced cmake files for mulle-sde C development

This is a [mulle-sde](/github.com/mulle-sde/mulle-sde) *meta extension*.
It supplements **mulle-sde** with useful functionality for C development
using mulle-c libraries.

It is also a convenient way to install mulle-sde. See
[mulle-sde-developer](/github.com/mulle-sde/mulle-sde-developer) for more
information about mulle-sde.

Library                                                  | Description
---------------------------------------------------------|----------------------------
[mulle-aba](//github.com/mulle-c/mulle-aba)              | Memory reclamation for concurrent algorithms
[mulle-allocator](//github.com/mulle-c/mulle-allocator)  | Memory allocation and leak checking
[mulle-buffer](//github.com/mulle-c/mulle-buffer)        | Memory storage and streams
[mulle-c11](//github.com/mulle-c/mulle-c11)              | Compiler glue
[mulle-concurrent](//github.com/mulle-c/mulle-concurrent)| Concurrent hashtable and array
[mulle-container](//github.com/mulle-c/mulle-concurrent) | ObjC Foundation like data structures
[mulle-sprintf](//github.com/mulle-c/mulle-sprintf )     | Extensible sprintf
[mulle-thread](//github.com/mulle-c/mulle-thread)        | Threads and locks (C11/pthread)
[mulle-utf](//github.com/mulle-c/mulle-utf )             | Unicode string library
[mulle-vararg](//github.com/mulle-c/mulle-vararg )       | An alternative vararg scheme


## Install

### Packages

OS      | Command
--------|------------------------------------
macos   | `brew install mulle-kybernetik/software/mulle-c-developer`
debian  | `sudo apt-get -y install mulle-c-developer` (but see below)
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

There is an `install-all` script, that installs the pre-requisites and
mulle-c-developer itself into `/usr`. Suitable for environments without
supported package managers:

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/installer-all' && \
chmod 755 installer-all && \
sudo SDE_PROJECTS="mulle-c-developer;latest
mulle-sde-developer;latest" ./installer-all /usr
```


# Usage

Check that the (meta) extensions are found:

```
mulle-sde extension list
```

## Create an executable mulle-c project

```
mulle-sde init -d hello-exe -m mulle-c/c-developer executable
```

## Create a library mulle-c project

```
mulle-sde init -d hello-lib -m mulle-c/c-developer library
```

