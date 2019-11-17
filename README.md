# 中国版 Dockerfile

由于 apt 等软件源使用的全球 CDN 难以在中国备案落地，导致中国开发者 docker build 很慢，影响效率，所以需要修改为国内源，进行加速。

## Docker

使用方法：非常简单，给 docker 名字加上“中国速度”前缀即可，比如 debian:10 变成了 chinaspeed/debian:10。

原版：

```
docker run -it debian:10 bash
apt update # 在中国很慢
```

中国版：

```
docker run -it chinaspeed/debian:10 bash
apt update # 在中国很快
```

中国厂商版：

```
docker pull chinaspeed/debian:10-tencent
docker pull chinaspeed/debian:10-aliyun
```

### 问答

- 如何添加需要的 Dockerfile？

在 GitHub 上发起 PR，或者提 issue。

- 为什么使用 chinaspeed 而不用 china-speed？

多个单词连在一起不可读，导致 IDE 警告，违反规范，我坚决反对，但 docker 官方要求只能使用全小写字母，非常无奈：

> Organization name must contain a combination of alphanumeric characters of 4-30 characters in length. Letters must be lowercase.

![fxxk docker hub: not allowed to use hyphen](https://user-images.githubusercontent.com/4971414/69003680-45fdb300-0941-11ea-82ab-739a4d686589.png)
