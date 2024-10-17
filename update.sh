echo 确保自己填入了正确的订阅链接
echo 重启subconverter
docker-compose down
docker-compose up -d subconverter
echo 暂停10s，等容器启动。若订阅链接访问失败，请检测是否配置好 subconverter 的代理。
echo 如用 fastgithub ，建议使用 ./fastgithub start 脚本注册为系统服务
sleep 10


echo 通过接口链接更新订阅
# 以下指令自行替换链接
wget -O ./data/config.yaml "https://tt.vg/freeclash" #双引号必须保留!!!
echo 将混合端口设置为7777，并开启允许局域网访问，若有需求请自行修改docker-compose和data/config.yaml文件（保证端口映射正确）
sed -i '/mixed-port/d' ./data/config.yaml
sed -i '/allow-lan/d' ./data/config.yaml
sed -i '/external-controller/d' ./data/config.yaml
sed -i '/secret:/d' ./data/config.yaml

sed -i '1a mixed-port: 7777' ./data/config.yaml
sed -i '1a allow-lan: true' ./data/config.yaml
sed -i '1a external-controller: "0.0.0.0:9090"' ./data/config.yaml
# sed -i '1a secret: "password"' ./data/config.yaml   # 设置密码


echo 关闭subconverter，重启clashs和clashui刷新配置文件
docker-compose down
docker-compose up -d clashs
docker-compose up -d clashui

echo 以下是可能的ip地址或者公网地址
ip add | grep inet

echo 更新完毕，若失败请检查docker-compose是否安装
echo 默认的clash控制面板地址为ip:7900
echo 默认的sub后端地址为ip:25500
echo 默认的sub前端地址为ip:7902
