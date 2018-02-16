# 🧢 Enhanced cmake files for mulle-sde C development

This is a **buildtool** extension for [mulle-sde](/mulle-sde/mulle-sde). It supplements the **mulle-sde** builtin cmake files, with useful
functionality for C development.


![](dox/mulle-c-developer.png)


Executable                   | Description
-----------------------------|--------------------------------
`mulle-c-sourcetree-update`  | Update src/dependencies.h from mulle-sourcetree


## Install

OS    | Command
------|------------------------------------
macos | `brew install mulle-kybernetik/software/mulle-c-developer`
other | ./install.sh  (Requires: [mulle-sde-c](https://github.com/mulle-sde/mulle-sde-c) and [mulle-sde-cmake](https://github.com/mulle-sde/mulle-sde-cmake))



**mulle-c-developer** usually installs to `/usr/share/mulle-sde/mulle-c` or `/usr/local/share/mulle-sde/mulle-c`.


## Create a **mulle-sde** "hello world" project:

```
$ mulle-sde init -d hello -b mulle-c:cmake -r mulle-c:c executable
```

