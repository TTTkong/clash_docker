echo 获取配置文件，速度因网络而异
wget -O ./data/config.yaml https://tt.vg/freeclash #此处填写订阅链接，然后记得检查订阅文件的外部端口是否为9090，很多都是

echo 将混合端口设置为7777，并开启允许局域网访问，若有需求请自行修改docker-compose和data/config.yaml文件
sed -i '/mixed-port/d' data/config.yaml
sed -i '/allow-lan/d' data/config.yaml

sed -i '1 i \mixed-port: 7777\n' data/config.yaml
sed -i '1 i \allow-lan: true\n' data/config.yaml

echo 重启容器，刷新配置文件
docker-compose down
docker-compose up -d

echo 以下是可能的ip地址或者公网地址
ip add | grep inet

echo 更新完毕，若失败请检查docker-compose是否安装
