.PHONY: ci_build docker_clean docker_interactive docker_verify sub
SHELL := /bin/bash

ci_build:
	DOCKER_BUILDKIT=1 docker build -t playscribe .

docker_clean:
	docker image prune -f

docker_interactive: ci_build docker_clean
	docker run --rm --env-file .env -it --entrypoint bash playscribe

docker_push: ci_build docker_clean
	echo $(DOCKERHUB_PASS) | docker login -u $(DOCKERHUB_USER) --password-stdin
	docker tag playscribe:latest $(DOCKERHUB_USER)/playscribe:latest
	docker push $(DOCKERHUB_USER)/playscribe:latest

docker_verify: ci_build docker_clean
	docker run --rm --env-file .env -i playscribe --listmodels

sub:
	@test $(URL) || ( echo [Usage] make sub URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_sub $(URL)