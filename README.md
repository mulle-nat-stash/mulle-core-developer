# 🧢 Enhanced cmake files for mulle-sde C development

This is a [mulle-sde](/mulle-sde/mulle-sde) *meta extension*.
It supplements **mulle-sde** with useful functionality for C development
with mulle-c.


## Install

OS    | Command
------|------------------------------------
macos | `brew install mulle-kybernetik/software/mulle-c-developer`
other | ./install.sh  (Requires: [mulle-sde-c](https://github.com/mulle-sde/mulle-sde-c) and [mulle-sde-cmake](https://github.com/mulle-sde/mulle-sde-cmake))


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

