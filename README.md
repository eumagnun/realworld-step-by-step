# realworld-notes

IDE
1. Tudo funciona mais facil com o IntelliJ
2. Apertar Ctrl, Ctrl e gradle bootRun

## No backend

1. instalar java: sudo apt install default-jdk -y
2. instalar wget: sudo apt install wget -y
3. instalar unzip: sudo apt install unzip -y
4. instalar git: sudo apt install git -y
5. Baixar gradle: $ wget -c https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp
6. Descompactar gradle: sudo unzip -d /opt/gradle /tmp/gradle-7.4.2-bin.zip
7. Setup variaveis gradle: sudo nano /etc/profile.d/gradle.sh e incluir o conteúdo abaixo
```
export GRADLE_HOME=/opt/gradle/gradle-7.4.2
export PATH=${GRADLE_HOME}/bin:${PATH}
```
5. Trocar permissão do arquivo: sudo chmod +x /etc/profile.d/gradle.sh
6. Instalar Gradle: source /etc/profile.d/gradle.sh
7. testar Gradle: gradle --version
8. clonar projeto:git clone https://github.com/eumagnun/realworld-springboot-java.git
9. Habilitar na classe SecurityConfiguration o método OPTIONS: 
10. Em application.properties habilitar a origem devida.Ex: http://localhost:56729
11. Em application.properties configurar o banco de dados
```
spring.datasource.url=jdbc:postgresql://10.0.0.5:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=12345
spring.datasource.driverClassName=org.postgresql.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=create-drop

security.allowedOrigins=http://localhost,http://localhost:80, http://IP_DE_ONDE_FRONT_ESTA_RODANDO
```

12. incluir dependencia no build.gradle: runtimeOnly 'org.postgresql:postgresql'
13. rodar
```
./gradlew build -x test bootRun
```

14. Gerar build -> ./gradlew build -x test
15. local arquivos build -> /realworld-springboot-java/build/libs
16. executar -> java -jar XXXXX.jarsudo

## No frontend

2. Para o build instalar Node, AngularCli, Yarn
3. curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
4. sudo apt install nodejs -y
5. node --version
6. npm --version
7. sudo npm install --global yarn
8. sudo npm install -g @angular/cli
9. clonar projeto: git clone https://github.com/eumagnun/angular-realworld-example-app.git
10. Em environment.ts definir a url da API
11. sudo ng --version
12. yarn install
13. rodar app: sudo ng serve --host 0.0.0.0 --port 80

14. instalar ngynx ->  sudo apt install nginx -y
15. validar se está rodando -> systemctl status nginx
16. build frontend -> sudo ng build --configuration production
17. clear frontend -> sudo rm -r /var/www/html/
18. deploy frontend -> sudo cp -r  angular-realworld-example-app/dist/ /var/www/html/

## Database:
1. Instalar Postgres: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
2. Porta padrão: port:5432
3. locagr com usuario postgres: sudo -u postgres psql
4. cadastrar senha: password
5. Reiniciar banco:
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
7. caso queira cadastrar novo usuário:
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

7. habilitar origens de conexão do postgres: sudo nano /etc/postgresql/13/main/postgresql.conf
8. n/a
9. n/a
10. restart postgress
```
sudo systemctl restart postgresql.service
```

11. conectar no banco: sudo -u postgres  psql -d appdb
10. info sobre a sessão atual no postgres: \conninfo

## Extra: 
1. CloudRouter vai ser necessário
2. Máquina do backend vai precisar de wget: sudo apt install wget
3. Máquina do backend vai precisar de unzip: sudo ap install unzip
4. Rodar processo em background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/
5. listar usuarios linux: less /etc/passwd



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
