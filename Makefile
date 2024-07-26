.PHONY: ci_build docker_clean docker_run sub
SHELL := /bin/bash

ci_build:
	DOCKER_BUILDKIT=1 docker build -t playscribe .

docker_clean:
	docker image prune -f

docker_run: docker_clean
	docker run --rm --env-file .env -it --entrypoint bash playscribe

sub:
	@test $(URL) || ( echo [Usage] make sub URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_sub $(URL)