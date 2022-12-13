
echo "::::::::installing tools"
apt update
apt install git -y
apt install openssl -y

echo ":::::::: generating new password"
VAR_DATABASE_PASSWORD=openssl rand -base64 32
echo "**********************"*************************"***"
echo $VAR_DATABASE_PASSWORD
echo "************************"*************************"*"

echo "::::::::installing database Postgres: Start"

echo "::::::::installing database"
apt install postgresql postgresql-contrib -y

echo "::::::::starting db service"
systemctl start postgresql.service

echo ":::::::: creating demo database named applicationdb"
sudo -u postgres createdb applicationdb

echo ":::::::: changing default user passwor"
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '${VAR_DATABASE_PASSWORD}';"

echo "::::::::cloning config project"
git clone https://github.com/eumagnun/realworld-step-by-step.git

echo ":::::::: changing current dir"
cd realworld-step-by-step

echo "::::::::replacing config files to enable external connectivity"
cp postgres-conf-files/* /etc/postgresql/13/main/

echo ":::::::: restaring database service"
systemctl restart postgresql.service

echo "::::::::installing database Postgres: Finish"
