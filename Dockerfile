FROM zmarcantel/cassandra

MAINTAINER David Kelley <hello@davidkelley.me>

ENV SOLR_VERSION 4.6.0

ENV SOLR solr-$SOLR_VERSION

RUN mkdir -p /opt

RUN wget -P /opt/ http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz

RUN tar -C /opt --extract --file /opt/$SOLR.tgz

RUN ln -s /opt/$SOLR /opt/solr

RUN apt-get update

RUN apt-get --yes install openjdk-6-jdk

EXPOSE 8983 7199 7000 7001 9160 9042

CMD nohup cass-dock & /bin/bash -c "cd /opt/solr/example; java -jar start.jar"