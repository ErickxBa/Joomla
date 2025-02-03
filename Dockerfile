# Usar la imagen oficial de PHP con Apache
FROM php:8.1-apache

# Instalar extensiones necesarias para Joomla
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar los archivos de Joomla al servidor
COPY . /var/www/html/

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

# Definir el directorio de trabajo
WORKDIR /var/www/html/

# Exponer el puerto 80 para Apache
EXPOSE 80

# Ejecutar Apache en primer plano
CMD ["apache2-foreground"]
