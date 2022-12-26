FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER joshianurag088@gmail.com
RUN yum install -y httpd \
 zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/koppee.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip koppee.zip
RUN cp -rvf koppee/*  .
RUN rm -rf koppee koppee.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 88
