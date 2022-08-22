export GITLAB_HOME=/srv/gitlab

docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 8888:80 --publish 8022:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 1G \
  gitlab/gitlab-ce:14.6.2-ce.0
