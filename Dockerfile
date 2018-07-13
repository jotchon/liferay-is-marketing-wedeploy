FROM alpine:latest

RUN apk update \
	&& apk upgrade \
	&& apk add bash docker git

COPY ./  /opt/dockerimagebuilder/

EXPOSE 8080

ENTRYPOINT ["tail", "-f", "/dev/null"]