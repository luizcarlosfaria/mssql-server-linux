# luizcarlosfaria/mssql-server-linux

## Same **microsoft/mssql-server-linux** docker image parameterizable like official **MySQL** and **Postgres** docker images

```
version: "3.7"

services:
    sql:
        image: luizcarlosfaria/mssql-server-linux:2019-latest
        environment: {
            "ACCEPT_EULA" : "Y",
            "SA_PASSWORD" : "8k3W2C2BVzAW9p",
            "MSSQL_DATABASE" : "db01",
            "MSSQL_DATABASE_COLLATE" : "SQL_Latin1_General_CP1_CI_AI",
            "MSSQL_USER" : "db01_dbowner_username",
            "MSSQL_PASSWORD" : "db01_dbowner_password",
        }
        ports: 
            - 1433:1433
        volumes: 
            - "./scripts/:/docker-entrypoint-initdb.d/"
```

*Dockerfile* | https://github.com/docker-gallery/mssql-server-linux

*PT-BR Project Home* | https://gago.io/blog/projetos/mssql-server-linux/


## Environment Variables

### **SA_PASSWORD** 
Like original **microsoft/mssql-server-linux** docker image
This environment variable is mandatory and specifies the password that will be set for the MSSQL SA superuser account. 

### **MSSQL_DATABASE** 
This environment variable is optional and allows you to specify the name of a database to be created on first run. If a user/password was supplied (see below) then that user will be granted owner access (corresponding to db_owner role) to this database.

### **MSSQL_DATABASE_COLLATE** 
By detault the new database will be crete with **SQL_Latin1_General_CP1_CI_AI** collate. This environment variable can be used to set another collation. [See all supported SQL Server Collations](https://raw.githubusercontent.com/docker-gallery/mssql-server-linux/master/all_collations.txt).

### **MSSQL_USER** and **MSSQL_PASSWORD**. 
These environment variables are optional, used to create a new user. This user will be granted owner permissions (see above) for the database specified by the MSSQL_DATABASE environment variable. Both variables are required for a user creation.

Do note that there is no need to use this mechanism to create the SA superuser, that user gets created by default with the password specified by the SA_PASSWORD variable.

### **MSSQL_PID**

MSSQL_PID is the Product ID (PID) or Edition that the container will run with. Acceptable values:

* **Developer** : This will run the container using the Developer Edition (this is the default if no MSSQL_PID environment variable is supplied)
* **Express** : This will run the container using the Express Edition
* **Standard** : This will run the container using the Standard Edition
* **Enterprise** : This will run the container using the Enterprise Edition
* **EnterpriseCore** : This will run the container using the Enterprise Edition Core
* <**valid product id**> : This will run the container with the edition that is associated with the PID

This image extends official mssql-server-linux. See more on [official **mssql-server-linux** image](https://hub.docker.com/r/microsoft/mssql-server-linux/) to understand license and find other Product Id's.

### **MSSQL_ATTACH_DATABASE_NAME** and **MSSQL_ATTACH_DATABASE_PATH**
These environment variables are optional, used to attach a database to server. 
- **MSSQL_ATTACH_DATABASE_NAME** indicates the name of database **and** is used to determine the name of the ``.mdf`` and ``.ldf`` files;
- **MSSQL_ATTACH_DATABASE_PATH** indicates the base path of the ``.mdf`` and ``.ldf`` files;

#### Example
Using `MSSQL_ATTACH_DATABASE_NAME = MyDatabase` and `MSSQL_ATTACH_DATABASE_PATH = /var/opt/mssql/data/custom-location/` will attach a database named **MyDatabase** thas uses **/var/opt/mssql/data/custom-location/MyDatabase**.mdf and **/var/opt/mssql/data/custom-location/MyDatabase**_log.ldf files; 

## Volumes

### /docker-entrypoint-initdb.d
When a container is started for the first time, a new database with the specified name will be created and initialized with the provided configuration variables. Furthermore, it will execute any file that are found in /docker-entrypoint-initdb.d as a SQL file over SA account. Files will be executed in alphabetical order. You can easily populate your MSSQL services by mounting a SQL dump into that directory and provide custom images with contributed data. SQL files will be imported by default to the database specified by the MSSQL_DATABASE variable.
