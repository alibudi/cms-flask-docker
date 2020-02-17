FROM python:3.6-slim
MAINTAINER Ali Budi Purnomo <alibudipuromo@gmail.com>

RUN apt-get update && apt-get install -qq -y \
    build-essential libpq-dev --no-install-recommends

ENV INSTALL_PATH /web_app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "web_app.app:create_app()"