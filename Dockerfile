FROM openjdk:8-jre
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.7.3/cerebro-0.7.3.zip -o /opt/cerebro-0.7.3.zip \
    && cd /opt \
    && unzip cerebro-0.7.3.zip \
    && rm cerebro-0.7.3.zip \
    && rm rm /opt/cerebro/conf/application.conf \
    && mv -f /opt/cerebro-0.7.3 /opt/cerebro \
    && useradd -ms /bin/bash cerebro \
    && chown -R cerebro:cerebro /opt/cerebro \
    && curl -L https://github.com/HASecuritySolutions/cerebro/raw/master/application.conf -o /opt/cerebro/conf/application.conf
USER cerebro
STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
