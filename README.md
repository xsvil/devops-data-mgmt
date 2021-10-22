# Next step for DevOps Engineer for SAP data management
The following repository contains:
- 2 Dockerfiles:
    - alpine based for a light installation and test
    - ubuntu 20.04 based
- docker-compose.yaml
    - 3 services:
        - web for an application
        - api for an API service
        - db for a database
    - 2 networks:
        - frontend
        - backend
- .env file which stores all the environment variables set and parsed in the **docker-compose.yaml** file
- bash script to initialize the docker compose services and network

The middle service - **api** is on both of the created networks in order to provide communication from **web** to **db** entirely through **api**.

[web] ---> [api] ---> [db]

## General Requirements:
```
docker
docker-compose
```
## MacOS Requirements:
```
Docker Desktop
```

## Prerequisite:
Make sure the docker daemon is running.

## Instructions:

```
1. Execute ./init.sh.
```

