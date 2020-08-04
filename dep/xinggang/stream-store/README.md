##编译
1. 到gostream跟目录
2. 制作docker镜像
    
        sudo make docker_apps_stream_store
3. 打包镜像

        sudo docker save -o docker-apps-stream-store.tar gostream/docker-apps-stream-store:latest
         sudo docker save -o nginx.tar nginx:latest

4. 将打包好的镜像放到dep下对应的文件夹下，如 dep/office，此目录为是根据具体部署环境的相关文件        

##安装
1. 获得lic.lic文件
    1. 执行./GetID --appid stream-store获得本机机器码
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
              - 1188:1188   #API端口

            command:
               同ports          单个文件最大时长，单位秒   过期文件检查周期，单位分钟       缓存目录，不用改           视频存储目录，不用改
             ["-APIPort","1188","-FileDuration","60","-ExpCheckInterval","10","-CachePath","/data/cache/","-StorePath","/data/video/"]
     
            volumes:
                视频缓存宿主机目录，尽量放到内存目录下
                - /dev/shm/video_cache/:/data/cache/
                视频存储宿主机目录
                - /opt/video_data/:/data/video/