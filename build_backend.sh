
echo "::::::::removing projects dir"
sudo rm -R realworld-springboot-java


echo "::::::::cloning project"
git clone https://github.com/eumagnun/realworld-springboot-java.git

echo "::::::::changing current dir"
cd realworld-springboot-java

echo "::::::::building project"
./gradlew build -x test

echo "::::::::copying builded files to remote server"
gcloud compute scp build/libs/realworld-spring-boot-java-2.1.1.jar backend-vm:/home/backend-app/backend.jar --internal-ip --zone=southamerica-east1-a

echo "::::::::killing old version and starting new"
FILE_NAME=$(date "+%Y%m%d-%T")
gcloud compute ssh backend-vm --zone=southamerica-east1-a --internal-ip --command "pkill -9 java ; nohup java -jar /home/backend-app/backend.jar > ./backend_'${FILE_NAME}'.out 2>backend_'${FILE_NAME}'.err &"

echo "::::::::getting info from new release execution"
gcloud compute ssh backend-vm --zone=southamerica-east1-a --internal-ip --command "ps -fC java"

echo "::::::::deploy finished"
