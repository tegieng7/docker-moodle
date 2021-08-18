## Introduction

#### Image for running Moodle `3.11.2`
- Image `tegieng7/moodle:3.11.2`
- Ubuntu 20.04
- Apache2
- PHP 7.4

## Usage

#### Set variables

```
MYSQL_ROOT_PASSWORD="db_root_password"
MYSQL_DATABASE="db_name"
MYSQL_USER="db_username"
MYSQL_PASSWORD="db_password"
```

#### Run container

```
docker-compose up -d
```

## Docs

https://docs.moodle.org/311/en/Step-by-step_Installation_Guide_for_Ubuntu

https://docs.moodle.org/311/en/OPcache#Configuration

https://techexpert.tips/apache/enable-https-apache/

