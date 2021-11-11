FROM ubuntu
ENV DEBIAN_FRONTEND=NONINTERACTIVE


# Install dependencies
RUN apt-get update -y
RUN apt-get -y install apache2 php git

# Install apache and deploying php sample  application
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/sairam484/samplephp-for-docker-build.git /var/www/html

WORKDIR /var/www/html

#COPY samplephp/*  /var/www/html/
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
