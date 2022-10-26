# realworld-notes

IDE
1. Tudo funciona mais facil com o IntelliJ
2. Apertar Ctrl, Ctrl e gradle bootRun

## No backend
1. Habilitar na classe SecurityConfiguration o método OPTIONS
2. Em application.properties habilitar a origem devida.Ex: http://localhost:56729
3. Em application.properties configurar o banco de dados
```
spring.datasource.url=jdbc:postgresql://10.0.0.5:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=12345
spring.datasource.driverClassName=org.postgresql.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=create-drop

security.allowedOrigins=http://localhost,http://localhost:80, http://34.95.209.220
```


4. instalar java: sudo apt install default-jdk -y
5. Baixar gradle: $ wget -c https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp
6. Descompactar gradle: sudo unzip -d /opt/gradle /tmp/gradle-7.4.2-bin.zip
7. Setup variaveis gradle: sudo nano /etc/profile.d/gradle.sh e incluir o conteúdo abaixo
```
export GRADLE_HOME=/opt/gradle/gradle-7.4.2
export PATH=${GRADLE_HOME}/bin:${PATH}
```
8. Trocar permissão do arquivo: sudo chmod +x /etc/profile.d/gradle.sh
9. Instalar Gradle: source /etc/profile.d/gradle.sh
10. testar Gradle: gradle --version


## No frontend
1. Em environment.ts definir a url da API
2. Para o build instalar Node, AngularCli, Yarn
3. curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
4. sudo apt install nodejs
5. node --version
6. npm --version
7. sudo npm install --global yarn
8. sudo npm install -g @angular/cli
9. sudo ng --version
10. yarn install



## Database:
1. Instalar Postgres: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
2. Porta padrão: port:5432
3. Usuario usuário postgres
```
sudo -u postgres psql
postgres=# create database mydb;
postgres=# create user myuser with encrypted password 'mypass';
postgres=# grant all privileges on database mydb to myuser;
```
4. Reiniciar banco:
```
restart: sudo systemctl restart postgresql.service
```
5. Problemas de autenticação:
```
https://dba.stackexchange.com/questions/131129/psql-fatal-peer-authentication-failed-for-user
```
6. achar arquivo pg_hba.conf
```
ls /etc/postgresql
sudo nano /etc/postgresql/13/main/pg_hba.conf

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

7. habilitar origens de conexão do postgres: sudo nano /etc/postgresql/13/main/postgresql.conf
8. n/a
9. n/a
10. restart postgress
```
sudo service postgresql restart
```

11. conectar no banco: sudo -u postgres  psql -d appdb
10. info sobre a sessão atual no postgres: \conninfo

## Extra: 
1. CloudRouter vai ser necessário
2. Máquina do backend vai precisar de wget: sudo apt install wget
3. Máquina do backend vai precisar de unzip: sudo ap install unzip
4. Rodar processo em background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/
