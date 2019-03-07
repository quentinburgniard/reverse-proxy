FROM wordpress:5-php7.2
ARG ACF_API_KEY
RUN apt update \
    && apt install wget unzip \
    && wget -q -O advanced-custom-fields-pro.zip "https://connect.advancedcustomfields.com/index.php?a=download&p=pro&k=$ACF_API_KEY" \
    && wget -q -O acf-to-rest-api.zip https://downloads.wordpress.org/plugin/acf-to-rest-api.3.1.0.zip \
    && wget -q -O api-wordpress-theme.zip https://github.com/quentinburgniard/api-wordpress-theme/archive/master.zip \
    && unzip -q advanced-custom-fields-pro.zip \
    && unzip -q acf-to-rest-api.zip \
    && unzip -q api-wordpress-theme.zip \
    && mkdir -p wp-content/plugins wp-content/themes \
    && mv -f advanced-custom-fields-pro wp-content/plugins/advanced-custom-fields-pro \
    && mv -f acf-to-rest-api wp-content/plugins/acf-to-rest-api \
    && mv -f api-wordpress-theme-master wp-content/themes/api-wordpress-theme \
    && rm advanced-custom-fields-pro.zip acf-to-rest-api.zip api-wordpress-theme.zip \
    && chown -R www-data:www-data .