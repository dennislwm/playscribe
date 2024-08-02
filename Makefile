.PHONY: ci_build docker_clean docker_interactive docker_verify sub
SHELL := /bin/bash

ci_build:
	DOCKER_BUILDKIT=1 docker build -t playscribe .

docker_clean:
	docker image prune -f

docker_genius: ci_build docker_clean
	cat $(FILE) | docker run --rm --env-file .env -i playscribe --pattern extract_article_wisdom

docker_interactive: ci_build docker_clean
	docker run --rm --env-file .env -it --entrypoint bash playscribe

docker_verify: ci_build docker_clean
	docker run --rm --env-file .env -i playscribe --listmodels

sub:
	@test $(URL) || ( echo [Usage] make sub URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_sub $(URL)