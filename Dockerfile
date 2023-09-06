# Use an official PHP image with Apache
FROM php:apache

# Update package lists and install required packages
RUN apt-get update && apt-get install -y libicu-dev libonig-dev

# Install PHP extensions: intl, mysqli, and mbstring
RUN docker-php-ext-install intl  
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install mbstring

# Enable Apache's mod_rewrite for clean URLs
RUN a2enmod rewrite

# Copy your application code into the container
COPY . /var/www/html

# Expose port 80 (default HTTP port)
EXPOSE 8081

# Start Apache as the main process
CMD ["apache2-foreground"]
