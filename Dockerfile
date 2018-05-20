FROM ubuntu:16.04

RUN apt-get update && apt-get install -y zip curl && apt-get clean -y
RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.7.3/cerebro-0.7.3.zip -o /opt/cerebro-0.7.3.zip && cd /opt && unzip cerebro-0.7.3.zip && mv -f /opt/cerebro-0.7.3 /opt/cerebro
RUN useradd -ms /bin/bash cerebro
RUN chown cerebro:cerebro /opt/cerebro
RUN curl -L https://github.com/HASecuritySolutions/cerebro/raw/master/application.conf -o /opt/cerebro/conf/application.conf
USER cerebro
STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
