.PHONY: $(MAKECMDGOALS)

docker_run:
	bash docker_run.sh
get_password:
	docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
docker_compose:
	docker-compose up -d
clean:
	docker kill gitlab || true
	docker rm gitlab || true
	rm -rf /srv/gitlab



