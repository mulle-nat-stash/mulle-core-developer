# 🧢 Enhanced cmake files for mulle-sde C development

This is a [mulle-sde](/mulle-sde/mulle-sde) *meta extension*.
It supplements **mulle-sde** with useful functionality for C development
with mulle-c.


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
sudo SDE_PROJECTS="mulle-sde-developer;latest
mulle-c-developer;latest" ./installer-all /usr
```

### Post Install


After installation check with `mulle-sde extension list` that the extension
is discoverable by **mulle-sde**

```
$ mulle-sde extension list | grep mulle-c
Available meta extensions [-m <extension>]:
...
mulle-c/c-developer
...
```



## Usage


### Create an executable mulle-c project

```
mulle-sde init -d hello-exe -m mulle-c/c-developer executable
```

### Create a library mulle-c project

```
mulle-sde init -d hello-lib -m mulle-c/c-developer library
```

