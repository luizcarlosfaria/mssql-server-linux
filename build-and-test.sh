clear 

docker build . --no-cache -t registry.oragon.io/library/mssql-server-linux:2019-latest

docker tag registry.oragon.io/library/mssql-server-linux:2019-latest luizcarlosfaria/mssql-server-linux:2019-latest

docker run \
--rm \
-it \
-e 'ACCEPT_EULA=Y' \
-e 'SA_PASSWORD=8k3W2C2BVzAW9p' \
-e 'MSSQL_DATABASE=db01' \
-e 'MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI' \
-e 'MSSQL_USER=bbb' \
-e 'MSSQL_PASSWORD=ccc' \
-p 1433:1433 \
registry.oragon.io/library/mssql-server-linux:2019-latest
