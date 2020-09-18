# Docker Open Connect Proxy

A Docker container that connects a cisco vpns and starts a small socks proxy.

## Why?

For when you need to access something on a full tunnel or poorly configured VPN but
don't want to route all of your host traffic through it.

## Useage

1. Start the vpn and follow prompts

```sh
docker run -it \
  --rm \
  --privileged \
  -p 1080:1080 \
  --cap-add=NET_ADMIN \
  cpitt/openconnect-proxy <VPN_URL> <OPENCONNECT_OPTION>
```

2.  Configure your application proxy requests through localhost:1080. For
    chrome I suggest https://github.com/FelisCatus/SwitchyOmega to selectively route traffic through the proxy
