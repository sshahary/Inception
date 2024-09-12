# Inception

Inception is a project that involves setting up a complex virtualized environment using Docker. The goal of the project is to deploy a network of Docker containers. The containers include an Nginx web server, a MariaDB database server, and a WordPress site, all configured through custom Dockerfiles. The entire setup is managed using docker compose and a Makefile for automation.

This project is part of the 42 curriculum, designed to provide hands-on experience with virtualization, containerization, and deployment of web services. By setting up a virtualized environment inside a Linux virtual machine, this project emphasizes the principles of system isolation, networking, and automated infrastructure management using Docker and Docker Compose


## Usage
Clone the repository:
```
https://github.com/sshahary/Inception.git
cd Inception
```
Ensure Docker and Docker Compose are installed on your Linux (virtual) machine.
#
Add your environment variables in:
```
Inception/srcs/.env
```
#
Build and start the containers using the Makefile:
```
make
```

## Containers

### Nginx: 
   Acts as a reverse proxy and web server, serving the WordPress site.

### MariaDB:
Provides the database backend for WordPress.

### WordPress: 
Hosts the WordPress CMS. It is linked to the MariaDB container and configured to use it as its database backend.

## License

[MIT](https://choosealicense.com/licenses/mit/)
