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
    apt-get install -y curl zip git gnupg libmcrypt-dev mysql-client libmagickwand-dev --no-install-recommends software-properties-common \
    # Install nodejs
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs npm && npm install --global gulp gulp-cli \ 
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql zip iconv opcache && \
    groupadd -g ${PGID} envdocker && \
    useradd -u ${PUID} -g envdocker -m envdocker && \
    usermod -p "*" envdocker

###########################################################################
# Set Timezone
###########################################################################
ARG TZ=UTC
ENV TZ ${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install php-cs-fixer
RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.0.0/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer
RUN chmod a+x /usr/local/bin/php-cs-fixer

COPY init.sh /usr/local/bin/init
RUN chmod +x /usr/local/bin/init

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

# Set default work directory
WORKDIR /var/www