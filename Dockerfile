FROM docker.arvancloud.ir/python:3.13-rc-alpine

WORKDIR /app

COPY ./requirements.txt .

RUN python -m venv ./venv
RUN python -m pip install -r requirements.txt
RUN source ./venv/bin/activate

COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser

COPY . .

EXPOSE 8000

CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]