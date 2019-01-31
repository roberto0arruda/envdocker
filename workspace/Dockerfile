# VERSION 0.1

FROM php:7.1-fpm

LABEL maintainer="Roberto Arruda <robero0arruda@hotmail.com>"

###########################################################################
# EnvDocker non-root user:
###########################################################################

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

# always run apt update when start and after add new source list, then clean up at end.
RUN apt-get update -yqq && \
    apt-get install -y wget git libmcrypt-dev mysql-client libmagickwand-dev --no-install-recommends && \
    pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql zip && \
    groupadd -g ${PGID} envdocker && \
    useradd -u ${PUID} -g envdocker -m envdocker && \
    usermod -p "*" envdocker && \
    apt-get clean

###########################################################################
# Set Timezone
###########################################################################
ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN wget -q https://getcomposer.org/composer.phar -O /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

COPY init.sh /usr/local/bin/init
RUN chmod +x /usr/local/bin/init

# Set default work directory
WORKDIR /var/www