#!/usr/bin/env bash

set -e

chown www-data:www-data /var/log

# python manage.py collectstatic --no-input

uwsgi --strict --ini /etc/app/uwsgi.ini
