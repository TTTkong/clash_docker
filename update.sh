echo 获取配置文件，默认的免费链接容易失效，建议自己寻找免费订阅进行聚合。
# 本地订阅链接转换服务获取，免费链接获取地址为  https://github.com/VPN-Subcription-Links/ClashX-V2Ray-TopFreeProxy
# 以下指令自行替换链接
# wget -O ./data/config.yaml https://tt.vg/freeclash #随时可能挂，建议自己找链接
wget -O ./data/config.yaml "https://raw.githubusercontent.com/ermaozi/get_subscribe/main/subscribe/clash.yml" #随时可能挂，建议自己找链接
echo 将混合端口设置为7777，并开启允许局域网访问，若有需求请自行修改docker-compose和data/config.yaml文件
sed -i '/mixed-port/d' data/config.yaml
sed -i '/allow-lan/d' data/config.yaml

sed -i '1a mixed-port: 7777' data/config.yaml
sed -i '1a allow-lan: true' data/config.yaml

echo 重启容器，刷新配置文件
docker-compose restart clashs

echo 以下是可能的ip地址或者公网地址
ip add | grep inet

echo 更新完毕，若失败请检查docker-compose是否安装
echo 默认的clash控制面板地址为ip:7900
echo 默认的sub后端地址为ip:25500
echo 默认的sub前端地址为ip:7902
