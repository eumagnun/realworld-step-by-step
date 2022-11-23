#Database variables
DATABASE_NAME=$1
DATABASE_USER=$2
DATABASE_PASSWORD=$3

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ];then
  echo "Please input DATABASE_NAME DATABASE_USER DATABASE_PASSWORD"
  exit 0
fi

echo "::::::::removing projects dir"
sudo rm -R realworld-springboot-java

echo "::::::::cloning project"
git clone https://github.com/eumagnun/realworld-springboot-java.git

echo "::::::::changing current dir"
cd realworld-springboot-java

echo ":::::::: getting database internal ip"
IP_DATABASE=$(gcloud compute instances describe database-vm --zone='southamerica-east1-a'  --format='get(networkInterfaces[0].accessConfigs[0].networkIP)')

echo ":::::::: getting frontend public ip"
IP_FRONTEND=$(gcloud compute instances describe backend-vm --zone='southamerica-east1-a'  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

echo ":::::::: replacing frontend ip"
sed -i "s|REPLACE_FRONTEND_IP|"${IP_FRONTEND}"|g" src/main/resources/application.properties

echo ":::::::: replacing database ip"
sed -i "s|REPLACE_FRONTEND_IP|"${IP_FRONTEND}"|g" src/main/resources/application.properties

echo "::::::::building project"
./gradlew build -x test

echo "::::::::copying builded files to remote server"
gcloud compute scp build/libs/realworld-spring-boot-java-2.1.1.jar backend-vm:/home/backend-app/backend.jar --internal-ip --zone=southamerica-east1-a

echo "::::::::killing old version and starting new"
FILE_NAME=$(date "+%Y%m%d")
gcloud compute ssh backend-vm --zone=southamerica-east1-a --internal-ip --command "pkill -9 java ; nohup java -jar /home/backend-app/backend.jar > ./backend_'${FILE_NAME}'.out 2>backend_'${FILE_NAME}'.err &"

echo "::::::::getting info from new release execution"
gcloud compute ssh backend-vm --zone=southamerica-east1-a --internal-ip --command "ps -fC java"

echo "::::::::deploy finished"
