# Docker Mysql

## 启动MySQL容器

```
docker run --name mysql -it \
    -e MYSQL_ROOT_PASSWORD_FILE=/run/secrets/mysql \
    -e MYSQL_USER_FILE=/run/secrets/mysql \
    -e MYSQL_PASSWORD_FILE=/run/secrets/mysql \
    -e MYSQL_DATABASE_FILE=/run/secrets/mysql \
    -p 33062:3306 \
    -v ~/myvapor-db:/var/lib/mysql \
    --rm -d soyl/mysql:0.1.1
```

容器内的数据库文件，就都会保存在~/myvapor-db中，备份起来就方便多了。

不过，在启动之前，要确保~/myvapor-db目录存在，否则会启动失败的。


## DeBug

要使用--default-authentication-plugin=caching_sha2_password选项，是为了稍后搭配Vapor使用。由于我们的容器使用了最新的MySQL 8.0，它的认证方式发生了改变

目前可以暂时使用mysql 5.7

```
docker run --name mysql -e MYSQL_USER=vapor  -e MYSQL_PASSWORD=vapor -e MYSQL_DATABASE=vapor -e MYSQL_ROOT_PASSWORD=vapor  -p 3306:3306 -d mysql/mysql-server:5.7

docker exec -it mysql bash

mysql -u root -p

use mysql;

GRANT ALL PRIVILEGES ON *.* TO 'vapor'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;

FLUSH PRIVILEGES;
```
