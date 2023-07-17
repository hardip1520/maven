git pull

echo "building images"
docker build -t hardip1520/jenkins-sample .

echo "docker login"

docker login --username=hardip1520 --password=Hardip@1520

echo "pushing image"

docker push hardip1520/jenkins-sample

echo "running container"

docker run -p 9090:8080 -d hardip1520/jenkins-sample
