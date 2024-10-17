cp config-temp.yaml ./data/config.yaml
docker-compose up -d
echo 以下是可能的ip地址或者公网地址
ip add | grep inet

echo 更新完毕，若失败请检查docker-compose是否安装
echo 默认的clash控制面板地址为ip:7900
echo 默认的sub后端地址为ip:25500
echo 默认的sub前端地址为ip:7902
echo 请检查是否能正常进去clash控制面板，并修改设置。
