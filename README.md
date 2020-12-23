# deploy
Container full of deployment tools

## Running

As root
```
docker run -it jacksonlabs/deploy:latest sh
```

As default user
```
docker run -it -u 1000:1000 jacksonlabs/deploy:latest sh
```

## Pinned Versions

### Base Images

- alpine 3.12

### Binaries

- terraform 0.14.3
- vault 1.6.1
- kubectl 1.19.4
- helm 3.4.2
- stern 1.11.0
- yq 4.1.0
- jq 1.6
- yj 5.0.0

### Alpine Packages

- python3 3.8.5-r0
- ansible 2.9.14-r0

### Terraform Providers

- external 2.0.0
- archive 2.0.0
- boundary 0.1.0
- cloudinit 2.1.0
- consul 2.10.1
- dns 3.0.0
- docker 2.7.2
- grafana 1.8.0
- helm 2.0.1
- http 2.0.0
- kubernetes 1.13.3
- kubernetes-alpha 0.2.1
- local 2.0.0
- null 3.0.0
- rundeck 0.4.0
- template 2.2.0
- terraform 1.0.2
- time 0.6.0
- tls 3.0.0
- vault 2.17.0
