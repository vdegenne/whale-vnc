# whale-vnc

This is a docker image of a debian stretch slim running Whale Browser in a VNC server that you can use to use Whale Browser in a system that doesn't handle .deb packages such as Fedora.
! THIS DOCKER IMAGE IS EXPERIMENTAL, USE AT YOUR OWN RISK !

## Installation

Directly from this repository

```bash
git clone https://github.com/vdegenne/whale-vnc.git && cd whale-vnc
docker build -t whale .
docker run --name whale -p 5900:5900 whale
```

Or pull directly from my docker hub :

```bash
docker pull vdegenne/whale
docker run --name whale -p 5900:5900 -e PASSWORD=secret whale
```

This will run a container with a VNC server listening on port `5900` and `secret` as the password to grant access (if `-e` is not specified, defaults to `1234`...).


## Usage

From a remote computer, run `vncviewer` from command line. Enter your vnc server ip. It will prompt for the password. Enter the password you used in the `docker run` command. Now you can use whale inside your operating system.