FROM python:3.4.5-alpine
COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app
RUN apk update && \
    apk add --upgrade expat zlib && \
    pip install -r requirements.txt
COPY dagda /opt/app
COPY ./dockerfiles/run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/sh","/run.sh"]
