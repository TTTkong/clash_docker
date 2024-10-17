# 简介
自己部署的 docker 项目文件夹，看得懂可以拿去用。目前在debian12、n1盒子上测试成功。
包含clash核心、clash-ui控制、订阅链接转换后端subconverter、订阅链接转换前端subweb


# 部署
- 安装必要软件
    - git 
    - docker-compose和docker，一般用包管理器就可以，也可以自己百度
    - fastgithub  
        保证订阅链接的正常访问，默认使用这种方式，请根据此项目部署https://github.com/WangGithubUser/FastGithub/releases
        如使用自己的代理请手动在docker-compose.yaml和data/pref.toml中修改并注释       

- 下载项目并进入文件夹
```
git clone https://github.com/TTTkong/clash_docker.git
cd clash_docker
```

- 配置文件
    - docker-compose.yaml
    - data/config.yaml
    - data/pref.toml
    - update.sh  每次更新会修改config.yaml文件，设置外部访问密码必须在此设置


- 初始化安装
```
sudo ./install.sh
```
此操作将启动全部服务，具体端口请在docker-compose.yaml文件中查看

- 定时更新
准备好订阅链接。并在 update.sh 中修改。也可以是由订阅转换后的聚合链接。

```
sudo ./update.sh
```
此操作将关闭sub后端和前端服务，仅保留clash和clashui服务
执行后进入clash-ui容器的网页端，查看是否正常。
```
crontab -e
```
在文件在追加一行
```
0 3 * * * cd /root/clash_docker/ && bash update.sh
```
每天凌晨3点更新
其中cd命令接上你的项目存放路径


# 多订阅合并更新
通过sub订阅链接转换服务将多个链接合并成聚合链接（姑且这么叫），subweb地址为ip:7902
链接直接获取的config.yaml可能用不了（clash的控制端没显示），就需要sub进行转换
# 卸载
在项目文件夹下运行
```
sudo docker-compose down
```
# 注意事项
- 更新脚本执行失败
一般是因为网络环境问题。请检查fastgithub是否正常运行。
排除后仍失败，也可以将update.sh的sleep 10的时间设置长一点，等待sub后端完全启动。

- 脚本执行失败
设置好执行权限，比如 `chmod a+x update.sh`

# 其他
- 关于镜像配置，可以看 https://github.com/LaoYutang/clash-and-dashboard
- 关于镜像下载不了，可以看 https://github.com/sky22333/Docker-Hub
- 关于订阅地址，可以看
    - 首选https://github.com/ermaozi/get_subscribe 
    - https://github.com/VPN-Subcription-Links/ClashX-V2Ray-TopFreeProxy



# 感谢
https://github.com/tindy2013/subconverter
https://github.com/stilleshan/subweb
https://github.com/LaoYutang/clash-and-dashboard
https://github.com/WangGithubUser/FastGithub
