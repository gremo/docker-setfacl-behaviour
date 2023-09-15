# docker-setfacl-behaviour

This repository demonstrates the inconsistent behavior of `setfacl` between Windows (and possibly MacOS) and Linux.

> TL;TR `setfacl` cannot be used with folders in a bind-mount on Linux, only on Windows (and possibly MacOS).

After starting the container (with Visual Studio Code, just run *Reopen in Container*), you will see two folders in `/workspace`:

- `folder-volume`: a Docker **volume**
- `folder-bind`: a regular **folder** inside the Docker bind-mount (the entire `/workspace` is bind-mounted)

## The problem

Running `setfacl` on `folder-volume`:

> `setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX /workspace/folder-volume`

- ✅ Windows works fine
- ✅ Linux works fine

Running `setfacl` command on `folder-bind`:

> `setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX /workspace/folder-bind`

- ✅ Windows works fine
- ❌ Linux throws the error *Not supported*

![setfacl](https://github.com/gremo/docker-setfacl-behaviour/assets/1532616/3bca96ec-cd8d-47fc-89c0-a1e71ccc3ae9)
