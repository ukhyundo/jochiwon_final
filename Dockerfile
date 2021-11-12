FROM python:3.9.0

WORKDIR /home/

RUN echo "stack배포 할때마다 바꾸기"

RUN git clone <본인 깃허브의 >

WORKDIR /home/LKLK/

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=<github의 repo이름>.settings.deploy && python manage.py migrate --settings=<github의 repo이름>.settings.deploy && gunicorn <github의 repo이름>.wsgi --env DJANGO_SETTINGS_MODULE=<github의 repo이름>.settings.deploy --bind 0.0.0.0:8000"]