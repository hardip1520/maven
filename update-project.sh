git pull

echo "building images"
docker build -t hardip1520/jenkins-sample .

echo "docker login"

docker login --username=hardip1520 --password=Hardip@1520

echo "pushing image"

docker push hardip1520/jenkins-sample

echo "running container"

docker-compose up -d
