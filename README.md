
# Autocomplete application

An small application that serves as an example of an autocomplete API using elasticsearch.
  
### Prerequisites

- Install Docker - [See Instalation](https://docs.docker.com/install/overview/)

- Install Docker Compose - [See instalation](https://docs.docker.com/compose/install/)

### Built with

- Ruby (2.6.3)

- Rails (6.0.2.2)

- PostgreSQL (10.12)

## Index

1. [Settings](#settings)  

1.1. [Starting the project](#starting-the-project)

2. [Runing commands](#run-commands)

3. [Stopping containers](#stop-and-remove-containers)

## Settings

1. `docker-compose up --build` 

2. `docker-compose run web rails db:create`

3. `docker-compose run web rails db:migrate`

4. `docker-compose run web rails db:seed`
  

[top ⇈](#settings)

### Starting the project

  

After the configuration is finished the project can be started like any ohter rails project
  

```

rails s

```

After the server is started the swagger documentation can be seen at

```
localhost:3000/api-docs/index.html
```

[top ⇈](#settings)

### Run Commands

We can also run the commands inside the containers using the command `docker-compose run`, specifying a container. If I want to run as `web` the specs, for example, I can use:

```

docker-compose run web bundle exec rspec

```

  
  

[top ⇈](#working-with-containers)

### Stop and Remove Containers

  

To stop a container running in the foreground, I use `Ctrl-C`. To stop a container in the background, I drag:

  

```

docker-compose stop db web

```

  

To stop all active containers, I can run the command without arguments, as in:

  
  

```

docker-compose stop

```

  

Note, however, that the `stop` command does not remove the containers, just to execute them. If I want to get into them again, I can use the `docker-compose -f dev.yml up` command and it will start the same container where I was working. To remove containers individually, we can run:

  

```

docker-compose rm db web

```

  

And we can also remove everything with:

  

```

docker-compose down

```

  

[top ⇈](#working-with-containers)
