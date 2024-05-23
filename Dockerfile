FROM docker.arvancloud.ir/python:3.11.4-slim-buster

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

# RUN python manage.py makemigrations
# RUN python manage.py migrate
# RUN python manage.py createsuperuser

EXPOSE 8000

CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]