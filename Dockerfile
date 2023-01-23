FROM ubuntu
RUN apt-get update -y && apt-get install -y nginx vim
RUN service nginx restart
WORKDIR  /home/ubuntu
RUN mkdir ssl
COPY ./naseeb.key /home/ubuntu/ssl
COPY ./naseeb.crt /home/ubuntu/ssl
COPY ./default /etc/nginx/sites-available/default
EXPOSE 80 443
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
