FROM openjdk:8-jre
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

# Base Path setting - Useful if you are using a reverse proxy
ENV BASEPATH /
RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.7.3/cerebro-0.7.3.zip -o /opt/cerebro-0.7.3.zip
RUN cd /opt \
    && unzip cerebro-0.7.3.zip \
    && rm cerebro-0.7.3.zip \
    && mv -f /opt/cerebro-0.7.3 /opt/cerebro \
    && rm /opt/cerebro/conf/application.conf
RUN useradd -ms /bin/bash cerebro \
    && chown -R cerebro:cerebro /opt/cerebro
RUN curl -L https://github.com/HASecuritySolutions/cerebro/raw/master/application.conf -o /opt/cerebro/conf/application.conf
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
USER cerebro
STOPSIGNAL SIGTERM

CMD /bin/bash /opt/entrypoint.sh
