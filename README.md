# war-base
CentOS 6 / tomcat 7 base image for war file deployment

# Usage

    $ docker build -t war-base:v1 .
    
## Interactive / development

    $ docker run -ti war-base:v1 bash
    [root@8a2183e1063c /]# tomcat-fg
    Usage: /usr/sbin/tomcat-fg {start|start-security|stop|version}
    
## Daemon

    $ docker ps -a
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                      PORTS                     NAMES
    ff7be060d008        war-base:v1         "tomcat-fg start"      About an hour ago   Up 7 seconds                0.0.0.0:49168->8080/tcp   sleepy_jang     
    
### Connect to daemon

    $ docker exec -ti sleepy_lang bash
    [root@8a2183e1063c /]# top
    
    top - 15:47:21 up  4:25,  0 users,  load average: 0.00, 0.01, 0.05
    Tasks:   4 total,   1 running,   3 sleeping,   0 stopped,   0 zombie
    Cpu(s):  0.1%us,  0.0%sy,  0.0%ni, 99.9%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
    Mem:   2056668k total,  1536376k used,   520292k free,    46748k buffers
    Swap:  1469256k total,   434176k used,  1035080k free,   439548k cached

      PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                                                                                                
       23 root      20   0 7359m 134m  16m S  0.7  6.7   0:02.68 java                                                                                                                    
        1 root      20   0 11356 2584 2308 S  0.0  0.1   0:00.11 tomcat-fg                                                                                                               
       44 root      20   0  105m 3112 2744 S  0.0  0.2   0:00.10 bash                                                                                                                    
       64 root      20   0 14952 1932 1724 R  0.0  0.1   0:00.00 top    
    
## Ports

Check the port mapping i.e., what is tomcat's default 8080 mapped to?

    0.0.0.0:49168->8080/tcp
    
Check IP address of docker server (boot2docker ip unless docker directly installed directly on Linux host)

    $ boot2docker ip
    192.168.59.103
    
Check URL:

    http://192.168.59.103:49168/
    
## Deploy WAR file

Base your own Docker file on this image and use the `ADD` command in your own Dockerfile to add the WAR file to the tomcat deployment directory:

    /var/lib/tomcat/webapps/



    