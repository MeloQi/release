##编译
1. 到gostream跟目录
2. 制作docker镜像
    
        sudo make docker_apps_stream
3. 打包镜像

        sudo docker save -o docker-apps-stream.tar gostream/docker-apps-stream

4. 将打包好的镜像放到dep下对应的文件夹下，如 dep/office，此目录为是根据具体部署环境的相关文件        

##安装
1. 获得lic.lic文件
    1. 执行./GetID --appid stream获得本机机器码
    2. 根据机器码从公司拿到license文件
    3. 将license覆盖lic目录下lic.lic文件

2. 安装docker和docker-compose，docker配置开机启动
    
    >
    >安装略，注意一个配置，需禁用docker的docker-proxy
    >
    >不同版本、不同系统禁用方式不同
    >
    >一版是在/etc/default/docker文件中DOCKER_OPTS加一个参数--userland-proxy=false
        
        DOCKER_OPTS="--userland-proxy=false"
        
3. 程序安装
    
        sudo ./install.sh
        
4. 启动及开机启动
        
        sudo ./start.sh
      
5. 停止
    
        sudo ./stop.sh
        
6. 配置说明
    
    配置都在docker-compose.yml文件中，配置前需要执行停止脚本 ./stop.sh
    
            端口更改需要和cmmand中参数一致
            ports:
              - 1088:1088   #API端口
              - 2554:2554   #rtsp端口
              - 1945:1945   #rtmp端口
              - 1946:1946   #http-flv端口
              - 40000-42000:40000-42000/udp     #rtp的udp端口

            command:
                #状态汇报地址                                  #公网或宿主机ip                   同ports          同ports          同ports          同ports           同ports                  同ports
              ["-c","http://192.168.6.21:1032/ipc/callback","-PublicIP","172.22.18.246","-APIPort","1088","-RtspPort","2554","-RtmpPort","1945","-FlvPort","1946","-UDPPortMin","40000","-UDPPortMax","42000"]