![devpod](https://raw.githubusercontent.com/Haskelleton/devpod/refs/heads/main/devpod.svg)
```shellsession
$ podman build -t devpod .
$ podman run -it --name=devpod -h devpod devpod:latest
```
### TODO
- [ ] diet
    - [ ] clear caches
    - [ ] delete temp/build files
- [ ] /dev/ volume
- [ ] healthcheck
- [ ] run nvim cmds to install & config LSP @ build time
