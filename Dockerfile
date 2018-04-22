# Use Alpine Linux
FROM alpine

# Retrieve required packages
RUN apk update && \
    apk --no-cache add \
    curl \
    nginx \
    php7 \
    php7-fpm \
    php7-pdo \
    php7-pdo_mysql \
    php7-imagick \
    php7-openssl \
    php7-mbstring \
    php7-curl \
    php7-dom \
    php7-intl \
    php7-fileinfo \
    php7-iconv \
    php7-zip \
    php7-session \
    php7-json \
    php7-ctype \
    php7-phar \
    php7-tokenizer \
    php7-xmlwriter

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Create user/group for nginx & create host folder for craftcms
RUN adduser -D -g www www && mkdir /www && chown -R root:www /www && chown -R www:www /var/lib/nginx

# Edit some php settings 
RUN sed -i "s|;*memory_limit =.*|memory_limit = 256M|i" /etc/php7/php.ini && \
    sed -i "s|;*max_execution_time =.*|max_execution_time = 300|i" /etc/php7/php.ini && \
    sed -i "s|;*max_input_time =.*|max_input_time = 300|i" /etc/php7/php.ini && \
    sed -i "s|group\s*=\s*nobody|group = www|g" /etc/php7/php-fpm.d/www.conf && \
    sed -i "s|user\s*=\s*nobody|user = www|g" /etc/php7/php-fpm.d/www.conf

# Import our predefined nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Expose craftcms host folder
VOLUME ["/www"]

# Expose ports
EXPOSE 80

# Import script that will start both nginx and php7-fpm
COPY startup.sh startup.sh

# Run startup.sh on container startup
RUN chmod +x ./startup.sh
CMD ["./startup.sh"]