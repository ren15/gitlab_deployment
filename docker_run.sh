export GITLAB_HOME=/srv/gitlab

docker run --detach \
  --publish 443:443 --publish 8080:80 --publish 8022:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 512m \
  
#   --hostname 10.2.0.11 \
