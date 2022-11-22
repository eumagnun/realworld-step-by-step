# realworld-notes

IDE
* Tudo funciona mais facil com o IntelliJ
* Apertar Ctrl, Ctrl e gradle bootRun

## Máquina de build
### Requisitos build backend
* executar script mount_backend_build_env.sh após criação da máquina

### Requisitos build frontend

## Máquina execução backend
* instalar JRE: sudo apt install default-jre -y
* baixar e configurar propriedades do back de acordo com o ambiente: https://github.com/eumagnun/realworld-notes/blob/main/application.properties


## Máquina execução frontend

* Para o build instalar Node, AngularCli, Yarn
* curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
* sudo apt install nodejs -y
* node --version
* npm --version
* sudo npm install --global yarn
* sudo npm install -g @angular/cli
* clonar projeto: git clone https://github.com/eumagnun/angular-realworld-example-app.git
* Em environment.ts definir a url da API[REPLACE BACKEND_API_ENDPOINT_AND_PORT]
* sudo ng --version
* yarn install
* rodar app: sudo ng serve --host 0.0.0.0 --port 80
* instalar ngynx ->  sudo apt install nginx -y
* validar se está rodando -> systemctl status nginx
* build frontend -> sudo ng build --configuration production
* clear frontend -> sudo rm -r /var/www/html/
* deploy frontend -> sudo cp -r  angular-realworld-example-app/dist/ /var/www/html/

## Database:
* Instalar Postgres: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
* Porta padrão: port:5432
* locagr com usuario postgres: sudo -u postgres psql
* cadastrar senha: password
* Reiniciar banco:
```
restart: sudo systemctl restart postgresql.service
```
* Problemas de autenticação:
```
https://dba.stackexchange.com/questions/131129/psql-fatal-peer-authentication-failed-for-user
```
* achar arquivo pg_hba.conf
```
ls /etc/postgresql
sudo nano /etc/postgresql/13/main/pg_hba.conf

```
* caso queira cadastrar novo usuário:
```
```
sudo -u postgres psql
postgres=# create database mydb;
postgres=# create user myuser with encrypted password 'mypass';
postgres=# grant all privileges on database mydb to myuser;
```
```
```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             0.0.0.0/0               md5
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     all             127.0.0.1/32            md5
host    replication     all             ::1/128                 md5
```

* habilitar origens de conexão do postgres: sudo nano /etc/postgresql/13/main/postgresql.conf
* restart postgress
```
sudo systemctl restart postgresql.service
```

* conectar no banco: sudo -u postgres  psql -d appdb
* info sobre a sessão atual no postgres: \conninfo

## Extra: 
* CloudRouter vai ser necessário
* Máquina do backend vai precisar de wget: sudo apt install wget
* Máquina do backend vai precisar de unzip: sudo ap install unzip
* Rodar processo em background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/
* Listar usuarios linux: less /etc/passwd



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
