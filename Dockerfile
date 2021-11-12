FROM python:3.9.0

WORKDIR /home/

RUN echo "stack배포 할때마다 바꾸기"

RUN git clone https://github.com/ukhyundo/jochiwon_final.git

WORKDIR /home/jochiwon_final/

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=jochiwon_final.settings.deploy && python manage.py migrate --settings=jochiwon_final.settings.deploy && gunicorn jochiwon_final.wsgi --env DJANGO_SETTINGS_MODULE=jochiwon_final.settings.deploy --bind 0.0.0.0:8000"]