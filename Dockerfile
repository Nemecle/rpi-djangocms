# djangoCMS Dockerfile for Raspberry Pi
FROM hypriot/rpi-python 
MAINTAINER nemecle <nemecle@protonmail.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python-pip \
	python-dev \
	build-essential \
	wget -y \
	sqlite3 \
	libffi-dev \
	libssl-dev \
	libtiff5-dev \
	libjpeg8-dev \
	zlib1g-dev \
	libfreetype6-dev \
	liblcms2-dev \
	libwebp-dev \
	python-tk \
	libjpeg-dev \
	libpng-dev
RUN pip install --upgrade pip
RUN pip install virtualenv \
	wheel \
	requests[security] \
	pillow \
	django \
	djangocms-installer
RUN useradd djangocms
RUN mkdir /home/djangocms -p
RUN chown -hvR djangocms /home/djangocms
# USER djangocms
RUN mkdir /home/djangocms/website && cd /home/djangocms/website
RUN mkdir /home/djangocms/website/app && cd /home/djangocms/website/app
#djangocms calls the wrong path
RUN ln -sf /usr/local/bin/django-admin /usr/bin/django-admin.py
RUN djangocms -f -q -p /home/djangocms/website/app blog \
        --db "sqlite://file///home/djangocms/website/djangocms.db" \
        --i18n yes \
        --django-version stable \
        --cms-version stable \
        --reversion yes \
        --languages "en" \
        --timezone "Europe/Paris" \
        --use-tz yes \
        --permissions yes \
        --bootstrap yes \
        --templates no \
        --starting-page yes
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'djangocms')" > admin_add.py
RUN echo python /home/djangocms/website/app/manage.py shell < admin_add.py
# USER root
EXPOSE 8000
CMD python /home/djangocms/website/app/manage.py runserver 0:8000 
# CMD sudo -u djangocms python /home/djangocms/website/app/manage.py runserver 0:8000
