FROM python:3.11

WORKDIR /opt/app

RUN  mkdir -p /var/www/static/ \
     && mkdir -p /var/www/media/ \
     && mkdir -p /opt/app/static/ \
     && mkdir -p /opt/app/media/

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV UWSGI_PROCESSES 1
ENV UWSGI_THREADS 16
ENV UWSGI_HARAKIRI 240
ENV DJANGO_SETTINGS_MODULE 'example.settings'

COPY ./run_uwsgi.sh /opt/app
COPY ./requirements.txt /opt/app
COPY ./uwsgi/uwsgi.ini /opt/app

# RUN  mkdir -p /var/www/static/ \
#      && mkdir -p /var/www/media/ \
#      && mkdir -p /opt/app/static/ \
#      && mkdir -p /opt/app/media/ \
#      && pip install --upgrade pip \
#      && pip install -r requirements.txt

RUN pip install --upgrade pip \
     && pip install -r requirements.txt

COPY . .

EXPOSE 8000

ENTRYPOINT ["uwsgi", "--strict", "--ini", "uwsgi.ini"]