# CREATE ON PREMISES STEPS SEQUENCE
* Create the infra with terraform scripts
* Install the posrgresql database on database-vm
* clone this repo on build-vm (use this procedure https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
* execute the next steps as described bellow:

## Máquina de build
### Requisitos build backend
* baixar e configurar propriedades do back de acordo com o ambiente: https://github.com/eumagnun/realworld-notes/blob/main/application.properties
* executar script mount_backend_build_env.sh após criação da máquina

### Requisitos build frontend
* executar script mount_frontend_build_env.sh após criação da máquina

## Máquina execução backend
* instalar JRE: sudo apt install default-jre -y após criação da máquina

## Máquina execução frontend
* instalar ngynx: sudo apt install nginx -y após criação da máquina

## Máquina Database:
* Instalar Postgres: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
* Porta padrão: port:5432

* Instalar Postgresql
````
sudo apt update
sudo apt install postgresql postgresql-contrib -y
````
* Iniciar serviço
````
sudo systemctl start postgresql.service
````

* criar database
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

* #consultar status
````
sudo systemctl status postgresql.service
````

* #logar postgress
````
sudo -u postgres psql
````

* #change password after logged in:
```
ALTER USER postgres PASSWORD 'postgres'
```

* #listar bancos
```
\l
```
* conectar em um banco de dados
````
\c postgres
````

* listar tabelas
````
select * from information_schema.tables

````

* listar artigos cadastrados
````
select * from articles

````



* caso necessário: remover postgresql
* https://kb.objectrocket.com/postgresql/how-to-completely-uninstall-postgresql-757

## Extra: 
* CloudRouter vai ser necessário
* Máquina do backend vai precisar de wget: sudo apt install wget
* Máquina do backend vai precisar de unzip: sudo ap install unzip
* Rodar processo em background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/
* Listar usuarios linux: less /etc/passwd

* NOTE IDE
* Tudo funciona mais facil com o IntelliJ
* Apertar Ctrl, Ctrl e gradle bootRun

## Migration steps
* Usuário com acesso a infra criada
* criar vpc
* criar firewall
* criar bucket em modo server
* criar server
* criar cloudsql
* criar vpn
* testar conectividade entre recursos
* migrar frontend e testar
* migrar backend com migrate for vm e testar
* migrar database com serviço de migração e testar
