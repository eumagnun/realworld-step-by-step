
echo "removing projects dir"
sudo rm -R realworld-springboot-java


echo "cloning project"
git clone https://github.com/eumagnun/realworld-springboot-java.git

echo "changing current dir"
cd realworld-springboot-java

echo "building project"
./gradlew build -x test

echo "copying builded files to remote server"
gcloud compute scp build/libs/realworld-spring-boot-java-2.1.1.jar backend-vm:/home/backend-app/ --internal-ip --zone=southamerica-east1-a

