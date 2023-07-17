git pull

echo "building images \n\n"
docker build -t hardip1520/jenkins-sample .

echo "docker login \n\n"

docker login --username=hardip1520 --password=Hardip@1520

echo "pushing image \n\n"

docker push hardip1520/jenkins-sample

echo "running container \n\n"

docker-compose up -d
