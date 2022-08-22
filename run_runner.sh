rm -rf /srv/gitlab-runner1

docker run --net=host --rm \
  -v /srv/gitlab-runner1/config:/etc/gitlab-runner \
  gitlab/gitlab-runner register \
    --non-interactive \
    --executor "docker" \
    --docker-image ubuntu:20.04 \
    --url "http://10.2.0.11:8888/" \
    --registration-token "ih3QnSZdqBEhySPN3H6d" \
    --description "runner1" \
    --maintenance-note "ec2 runner" \
    --tag-list "gfw_free,vps" \
    --run-untagged="true" \
    --locked="false" \
    --access-level="not_protected"

docker run --net=host -d --name gitlab-runner1 --restart always \
  -v /srv/gitlab-runner1/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest