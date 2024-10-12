#!/usr/bin/env bash

set -e

chown www-data:www-data /var/log

python manage.py makemigrations --no-input
python manage.py migrate --no-input

python manage.py collectstatic --no-input

uwsgi --strict --ini uwsgi.ini
