# <h1 align="center">EnvDocker</h1>

This package provides an environment Docker for applications developed in Laravel.

## How to use Environment

```console
$ git clone https://github.com/roberto0arruda/envDocker.git
$ cd envdocker/
$ cp .env.example .env
```

- Configure the `.env` file with your settings: 
    - DB_CONNECTION = mysql, sqlite, pgsql or sqlsrv
    - DB_HOST       = Database server ip or if localdb mysql
    - DB_PORT       = 3306
    - DB_DATABASE   = Database name
    - DB_USERNAME   = User
    - DB_PASSWORD   = Password

## Basics commands docker

### Run build Container
```console
$ docker-compose build
```

### For start containers
```console
$ docker-compose up -d
```

### For execute commands on container
```console
$ docker-compose exec workspace your-command-here
```

Added a non-root user to prevent files being created with root permissions on host machine.
user non-root envdocker:
```console
$ docker-compose exec --user=envdocker workspace your-command-here
```

###### For init project
```console
$ docker-compose exec --user=envdocker workspace init
```

### For stop container
```console
$ docker-compose down
```

### Run rebuild Container
If there is any change in the container, run the command with container stopped
```console
$ docker-compose up -d --build
```

> `Note:`
Application run in `http://localhost/`
PhpMyAdmin run in `http://localhost:8080/`