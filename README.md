# uw-varnish

[![Docker Repository on Quay](https://quay.io/repository/utilitywarehouse/uw-varnish/status "Docker Repository on Quay")](https://quay.io/repository/utilitywarehouse/uw-varnish)

Alpine based varnish docker image.

Config

* expects `/config/default.vcl` to successfully start
* env `VARNISH_MEMORY` to allocate desired memory

Get the image with:

```
docker pull quay.io/utilitywarehouse/uw-varnish
```