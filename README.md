# Migration Demo

##Main Goal
* Migrate a simulated onpremises 3 layer application to a Google Cloud env using MIgrate to VMs e Database Migration Service
![alt text]([http://url/to/img.png](https://raw.githubusercontent.com/eumagnun/realworld-step-by-step/main/migration-demo-strategy.png))

## on-premises env creation step-by-step

### 1 Create google cloud resources with terraform
* Create the infra with terraform this scripts (folder: on-prem-env)
````
https://github.com/eumagnun/realworld-terraform-scripts
````
### 2 - Install de Datatabase on database-vm:

* Access the database-vm and execute the following steps:
````
sudo apt update
sudo apt install postgresql postgresql-contrib -y
````
* start service
````
sudo systemctl start postgresql.service
````

* create database
````
sudo -u postgres createdb applicationdb
````
* #edit files bellow to enable external connectivity

* #file 1: 
````
sudo nano /etc/postgresql/13/main/postgresql.conf
````
````
listen_addresses = '*'
````

* #file 2: 
````
sudo nano /etc/postgresql/13/main/pg_hba.conf
````
````
# IPv4 local connections:
host    all           	all        	0.0.0.0/0            	md5
````

* #restart the database
````
sudo systemctl restart postgresql.service
````

* #query service status
````
sudo systemctl status postgresql.service
````

* #login postgress
````
sudo -u postgres psql
````

* #change password [option1]:
```
ALTER USER postgres PASSWORD 'postgres'
```
* #change password [option2]:
````
\password postgres
````
* #list databases
```
\l
```
* connect to a database
````
\c postgres
````

* list tables
````
select * from information_schema.tables

````

* list articles
````
select * from articles

````

### 3 - Do the setup on build-vm
* create a service account with role "instanceAdmin" and associate it to build-vm
* install git on build-vm
````
sudo apt install git
````
* clone this repo on build-vm 
* execute the script mount_backend_build_env.sh
* execute the script mount_frontend_build_env.sh

### 4 - Deploy the application through build-vm
* execute the script build-backend.sh
* execute the script build-frontend.sh


### Utils:
* Working with private github repos: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)

* Installing Postgres: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

* Default Postgres port:5432

* If necessary remove Postgresql: https://kb.objectrocket.com/postgresql/how-to-completely-uninstall-postgresql-757

* List Unix users: less /etc/passwd

* Run process on background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/

* Run the backend porject on IntelliJ: Press Ctrl, Ctrl and gradle bootRun
