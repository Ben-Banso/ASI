FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y netcat
COPY date-netcat.sh app/
EXPOSE 3000
CMD app/date-netcat.sh
