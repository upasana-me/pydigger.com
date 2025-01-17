FROM python:3.9

RUN apt-get update           && \
    apt-get install -y less  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
COPY .bashrc /root/
COPY requirements.txt /opt/
RUN pip install -r /opt/requirements.txt

COPY . .

ENV FLASK_APP=PyDigger.website
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]
