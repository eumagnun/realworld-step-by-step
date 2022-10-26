# realworld-notes

IDE
1. Tudo funciona mais facil com o IntelliJ
2. Apertar Ctrl, Ctrl e gradle bootRun

## No backend
1. Habilitar na classe SecurityConfiguration o método OPTIONS
2. Em application.properties habilitar a origem devida.Ex: http://localhost:56729
3. Em application.properties configurar o banco de dados
4. instalar java: sudo apt install default-jdk -y
5. Baixar gradle: $ wget -c https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp
6. Descompactar gradle: sudo unzip -d /opt/gradle /tmp/gradle-7.4.2-bin.zip
7. Setup variaveis gradle: sudo nano /etc/profile.d/gradle.sh
7.1. export GRADLE_HOME=/opt/gradle/gradle-7.4.2
7.2. export PATH=${GRADLE_HOME}/bin:${PATH}
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

https://wiki.postgresql.org/wiki/Apt#Quickstart
default port:5432
restart: sudo systemctl restart postgresql.service
11. spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
spring.jpa.hibernate.ddl-auto=none
spring.jpa.hibernate.show-sql=true
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=admin


spring.datasource.initialization-mode=always
spring.datasource.initialize=true
spring.datasource.schema=classpath:/schema.sql
spring.datasource.continue-on-error=true

sudo -u postgres psql
postgres=# create database mydb;
postgres=# create user myuser with encrypted password 'mypass';
postgres=# grant all privileges on database mydb to myuser;

https://dba.stackexchange.com/questions/131129/psql-fatal-peer-authentication-failed-for-user

## Extra: 
1. CloudRouter vai ser necessário
2. Máquina do backend vai precisar de wget: sudo apt install wget
3. Máquina do backend vai precisar de unzip: sudo ap install unzip
4. Rodar processo em background: https://udgwebdev.github.io/dicas-de-terminal-processos-em-background/
