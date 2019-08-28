FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER wangiegie@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /pigx-activiti

WORKDIR /pigx-activiti

EXPOSE 5005

ADD ./pigx-visual/pigx-activiti/target/pigx-activiti.jar ./

CMD sleep 30;java -Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom -jar pigx-activiti.jar


# cat Dockerfile
FROM centos:7
#他的妈妈是谁
MAINTAINER www.aliangedu.com
#他的爸爸是谁

ENV VERSION=8.5.33
#tomcat版本
ENV JAVA_HOME /usr/local/jdk
#jdk 绝对路径

RUN yum install wget -y
#运行的命令

RUN wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz && \
    tar zxf apache-tomcat-${VERSION}.tar.gz && \
    mv apache-tomcat-${VERSION} /usr/local/tomcat && \
    rm -rf apache-tomcat-${VERSION}.tar.gz /usr/local/tomcat/webapps/* && \
    mkdir /usr/local/tomcat/webapps/ROOT

EXPOSE 5005
#程序使用的端口
CMD /usr/local/tomcat/bin/catalina.sh run
#执行tomcat目录下的启动脚本，这里面遇到坑，就是-v 将宿主机jdk目录挂在到容器/usr/local/jdk 时候，因为镜像按照dockerfile去打，那么在执行命令的时候就会找不到路径，所以我临时删除了，EXPOSE与CMD 2行，然后重新打包，使用 -p 指定端口，然后进入容器，手工启动tomcat的方式，进行