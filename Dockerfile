FROM zmarcantel/cassandra

MAINTAINER David Kelley <hello@davidkelley.me>

ENV SOLR_VERSION 4.6.0

ENV SOLR solr-$SOLR_VERSION

RUN mkdir -p /opt

ADD http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
# ADD http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz

RUN tar -C /opt --extract --file /opt/$SOLR.tgz

RUN ln -s /opt/$SOLR /opt/solr

RUN apt-get update

RUN apt-get --yes install openjdk-6-jdk

EXPOSE 8983

CMD ["/bin/bash", "-c", "cd /opt/solr/example; java -jar start.jar"]