# ubuntu

## doker-compose

### build

```
docker-compose build
```

### bash

```
docker-compose run --rm ubuntu:dev_ruby3 bash
```

## doker

### build

```
docker build -t ubuntu20:dev-ruby3 -f Dockerfile .
```

### bash

```
docker run --rm -it --name demo ubuntu20:dev-ruby3
```
