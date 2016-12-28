FROM kevin0209/python2:latest

RUN yum install -y libxslt-devel libogg-devel libvorbis-devel libspeex-devel
RUN pip install supervisor qiniu redis

WORKDIR /tmp
ADD speex-1.2rc2.tar.gz ./
WORKDIR /tmp/speex-1.2rc2
RUN ./configure --libdir=/usr/lib &&\
   make && make install


RUN useradd dashu
USER dashu
WORKDIR /home/dashu
ADD icecast.tar.gz ./
ADD WeixinRobot.tar.gz ./
ADD run ./
RUN chmod +x run
CMD ["/home/dashu/run"]
