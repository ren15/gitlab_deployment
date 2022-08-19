docker run --net=host --rm \
  -v /srv/gitlab-runner1/config:/etc/gitlab-runner \
  gitlab/gitlab-runner register \
    --non-interactive \
    --executor "docker" \
    --docker-image ubuntu:20.04 \
    --url "http://10.2.0.11:8080/" \
    --registration-token "xEaQvYzKBMSK_oszPhAj" \
    --description "docker-runner" \
    --maintenance-note "racknerd 3C 3G from WR, 12/04/2022" \
    --tag-list "racknerd,gfw_free,vps" \
    --run-untagged="true" \
    --locked="false" \
    --access-level="not_protected"

docker run --net=host -d --name gitlab-runner2 --restart always \
  -v /srv/gitlab-runner1/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest