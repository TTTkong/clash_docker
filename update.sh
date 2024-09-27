echo 获取链接，速度因网络而异

wget -O ./data/config.yaml https://tt.vg/freeclash #此处填写订阅链接，然后记得检查订阅文件的外部端口是否为9090，很多都是

echo 重启容器，刷新配置文件
docker-compose up -d --force-recreate

echo 以下是可能的ip地址或者公网地址
ip addr

echo 更新完毕，若失败请检查docker-compose是否安装