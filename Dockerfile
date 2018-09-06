FROM python:2.7

WORKDIR /home/MW2D

COPY requirements.txt .

RUN pip install -r requirements.txt
