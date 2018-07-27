FROM microsoft/mssql-server-linux
LABEL AUTHOR="Luiz Carlos Faria <luizcarlosfaria@gmail.com>"

VOLUME /docker-entrypoint-initdb.d

ENV MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI

EXPOSE 1433

RUN ln -s /opt/mssql-tools/bin/sqlcmd   /usr/local/bin/sqlcmd \
    && ln -s /opt/mssql-tools/bin/bcp   /usr/local/bin/bcp

COPY ./docker-entrypoint.sh             /usr/local/bin/

COPY ./docker-entrypoint-initdb.sh      /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]