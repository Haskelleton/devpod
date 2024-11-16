![devpod](https://gist.github.com/user-attachments/assets/556d6941-fc11-43cf-b727-7a0785b4d225)
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
