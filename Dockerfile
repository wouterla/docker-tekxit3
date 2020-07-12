FROM ubuntu:latest

WORKDIR /

EXPOSE 25565 25565 25575

#define the volume
VOLUME [ "/data" ]

#update all the things
RUN apt-get update -y
#install the things
RUN apt-get install curl unzip megatools openjdk-8-jre -y

# default url to start with
ENV SERVER_URL=https://www.tekx.it/downloads/0.981Tekxit3Server.zip


# download tekxit server
RUN curl -so mc.zip ${SERVER_URL}
RUN unzip mc.zip -d /data-temp

# startup script
COPY ./start.sh start.sh
# make sure startup script can run
RUN chmod +x ./start.sh

# min memory use for this modpack
ENV INIT_MEM=4G
# max mem that we should let java use
ENV MAX_MEM=6G

#execute startup script on startup
ENTRYPOINT [ "./start.sh" ]