function get_sub {
  if [ -z "$1" ]; then
    echo "[Usage][$FUNCNAME]: $FUNCNAME URL"
    return 1
  fi
  yt-dlp --version > /dev/null 2>&1 || ( echo "[ERROR][$FUNCNAME]: yt-dlp not installed." && return 1 )
  jq --version > /dev/null 2>&1 || ( echo "[ERROR][$FUNCNAME]: jq not installed." && return 1 )
  local url="$1"
  FILE=$( yt-dlp -e "${url}" )
  echo $FILE.txt
  yt-dlp --skip-download --write-auto-sub --quiet --output "${FILE}" --sub-format json3 ${URL}
  jq -r '.events[]|select(.segs and.segs[0].utf8!="\n")|[.segs[].utf8]|join("")' "${FILE}.en.json3" | paste -sd\ -|fold -sw60 >> "examples/transcript.txt"
  rm "${FILE}.en.json3"
}