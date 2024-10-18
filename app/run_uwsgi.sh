#!/usr/bin/env bash

set -e

chown www-data:www-data /var/log

while ! nc -z $SQL_HOST $SQL_PORT; do
    sleep 0.1
done

python manage.py migrate --no-input
python manage.py collectstatic --no-input

uwsgi --strict --ini uwsgi.ini
