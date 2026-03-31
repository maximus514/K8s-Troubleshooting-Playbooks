while true; do echo "$(date '+%Y-%m-%d %H:%M:%S') $(curl -s -o /dev/null -w '%{http_code}' https://www.google.com)"; sleep 1; done
