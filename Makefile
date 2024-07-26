.PHONY: sub
SHELL := /bin/bash

sub:
	@test $(URL) || ( echo [Usage] make sub URL=YOUTUBE_LINK; exit 1 )
	@source ./yt-dlp.sh && get_sub $(URL)