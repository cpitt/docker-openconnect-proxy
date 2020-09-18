# Docker Open Connect Proxy

A Docker container that connects a cisco vpns and starts a socks proxy on port 8080

## Useage

```sh
docker run -it --rm --privileged -p 1080:1080 --cap-add=ALL cpitt/openconnect-proxy <VPN_URL> <OPENCONNECT_OPTION>
```
