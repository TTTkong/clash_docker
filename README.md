# docker项目合计
自己部署的 docker 项目文件夹，看得懂可以拿去用，debian12
包含clash核心、clash-ui控制、订阅链接转换后端subconverter、订阅链接转换前端subweb

# 初始化
执行install.sh、启动全部服务
# 更新
## 单订阅更新
直接修改update.sh里面的链接为你的订阅地址

## 多订阅合并更新
通过sub订阅链接转换服务将多个链接合并成聚合链接（姑且这么叫），web地址为ip:7902
将update.sh里面的链接替换为这个聚合链接（必须保证sub后端服务开启）

# 其他
- 关于镜像配置，可以看 https://github.com/LaoYutang/clash-and-dashboard
- 关于镜像下载不了，可以看 https://github.com/sky22333/Docker-Hub
- 关于订阅地址，可以看
    - 首选https://github.com/ermaozi/get_subscribe 
    - https://github.com/VPN-Subcription-Links/ClashX-V2Ray-TopFreeProxy

嫌弃内存占用，可以使用在线的subweb前端，或者在获取聚合链接后，将前端服务关闭
```sudo docker-compose down subweb```



# 感谢
https://github.com/tindy2013/subconverter
https://github.com/stilleshan/subweb
https://github.com/LaoYutang/clash-and-dashboard