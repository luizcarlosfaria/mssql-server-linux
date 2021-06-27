FROM mcr.microsoft.com/mssql/server:2019-latest
LABEL AUTHOR="Luiz Carlos Faria <luizcarlosfaria@gmail.com>"

	
USER root

VOLUME /docker-entrypoint-initdb.d

ENV MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI

EXPOSE 1433

COPY ./docker-entrypoint.sh             /usr/local/bin/

COPY ./docker-entrypoint-initdb.sh      /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh 
RUN chmod +x /usr/local/bin/docker-entrypoint-initdb.sh

RUN mkdir -p -m 777 /var/opt/mssql
RUN mkdir -p -m 777 /var/opt/mssql/log
RUN mkdir -p -m 777 /var/opt/mssql/data
RUN mkdir -p -m 777 /var/opt/sqlserver
RUN chmod -R 777 /var/opt/mssql /var/opt/sqlserver /var/opt/mssql/data /var/opt/mssql/log
RUN chown -R mssql /var/opt/mssql /var/opt/sqlserver /var/opt/mssql/data /var/opt/mssql/log


ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

RUN mkdir cd /home/mssql/

RUN chown mssql /home/mssql/

USER mssql

