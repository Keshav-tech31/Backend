# Base image
FROM php:8.3-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html/

# Copy all files to container
COPY . /var/www/html/

# Install MongoDB PHP extension
RUN apt-get update && \
    apt-get install -y libssl-dev pkg-config && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb