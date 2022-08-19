.PHONY: $(MAKECMDGOALS)

docker_run:
	bash docker_run.sh
get_password:
	docker exec gitlab grep 'Password:' /etc/gitlab/initial_root_password
clean:
	docker kill gitlab || true
	docker rm gitlab || true
	rm -rf /srv/gitlab



