-include .env

.PHONY: check_env ci_build docker_clean docker_interactive docker_verify output sub
SHELL := /bin/bash
DOCKER_PS := $(shell $(DOCKER) ps 2> /dev/null)

check_env:
ifndef OPENAI_API_KEY
	$(error Environment variable OPENAI_API_KEY not set)
endif
ifndef DOCKER
	$(error Environment variable DOCKER not set)
endif
ifndef DOCKER_IMAGE
	$(error Environment variable DOCKER_IMAGE not set)
endif
ifndef DOCKER_PS
	$(error $(DOCKER) daemon is not running)
endif

ci_build: check_env
	DOCKER_BUILDKIT=1 $(DOCKER) build -t playscribe .

docker_clean: check_env
	$(DOCKER) image prune -f

docker_genius: ci_build docker_clean
	$(DOCKER) run --rm --env-file .env -i playscribe --pattern extract_article_wisdom

docker_interactive: ci_build docker_clean
	$(DOCKER) run --rm --env-file .env -it --entrypoint bash playscribe

docker_verify: ci_build docker_clean
	$(DOCKER) run --rm --env-file .env -i playscribe --listmodels

genius: check_env
	@test $(URL) || ( echo [Usage] make genius URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_output $(URL)
	@cat output.txt | $(DOCKER) run --rm --env-file .env -i playscribe --pattern extract_article_wisdom && rm output.txt

sub:
	@test $(URL) || ( echo [Usage] make sub URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_sub $(URL)