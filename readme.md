# luizcarlosfaria/mssql-server-linux

## Same **microsoft/mssql-server-linux** docker image parameterizable like official **MySQL** and **PostgreSQL** docker images

```
docker run \
--rm \
-it \
-e 'ACCEPT_EULA=Y' \
-e 'SA_PASSWORD=8k3W2C2BVzAW9p' \
-e 'MSSQL_DATABASE=db01' \
-e 'MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI' \
-e 'MSSQL_USER=new_username' \
-e 'MSSQL_PASSWORD=new_password' \
-p 1433:1433 \
luizcarlosfaria/mssql-server-linux:latest

```

## Environment Variables

### **SA_PASSWORD** 
Like original **microsoft/mssql-server-linux** docker image
This variable is mandatory and specifies the password that will be set for the MSSQL SA superuser account. 

### **MSSQL_DATABASE** 
This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted owner access (corresponding to db_owner role) to this database.

### **MSSQL_DATABASE_COLLATE** 
By detault the new database will be crete with **SQL_Latin1_General_CP1_CI_AI** collate. This environment variable can be used to set another ollation. [See all supported SQL Server Collations](https://raw.githubusercontent.com/docker-gallery/mssql-server-linux/master/all_collations.txt).

### **MSSQL_USER** and **MSSQL_PASSWORD**. 
These variables are optional, used in conjunction to create a new user and to set that user's password. This user will be granted owner permissions (see above) for the database specified by the MSSQL_DATABASE variable. Both variables are required for a user to be created.

Do note that there is no need to use this mechanism to create the SA superuser, that user gets created by default with the password specified by the SA_PASSWORD variable.


## Volumes

### /docker-entrypoint-initdb.d
When a container is started for the first time, a new database with the specified name will be created and initialized with the provided configuration variables. Furthermore, it will execute any file that are found in /docker-entrypoint-initdb.d as a SQL file over SA account. Files will be executed in alphabetical order. You can easily populate your MSSQL services by mounting a SQL dump into that directory and provide custom images with contributed data. SQL files will be imported by default to the database specified by the MSSQL_DATABASE variable.