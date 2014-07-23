FROM debian:jessie
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

RUN echo "deb http://http.debian.net/debian jessie main contrib non-free" > /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y velvet bsdmainutils bioperl

ADD http://www.vicbioinformatics.com/VelvetOptimiser-2.2.5.tar.gz /tmp/
RUN tar xzf /tmp/VelvetOptimiser-2.2.5.tar.gz
RUN mv /VelvetOptimiser-2.2.5 /usr/local/velvet_optimiser
ENV PATH $PATH:/usr/local/velvet_optimiser

ADD run /
ADD Procfile /

ENTRYPOINT ["/run"]
