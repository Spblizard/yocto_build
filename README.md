# yocto_build

## first Run

```
docker run -it --privileged --name yocto -v /path/to/yoctoSource:/home/dev nameYoctoBuild
```
--privileged - for use tun into qemu

## if already runned

```
docker exec -it yocto bash
```

## Not runned but container exist

```
docker start -i yocto
```
