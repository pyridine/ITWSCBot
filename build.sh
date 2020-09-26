# First arg is tag name, otherwise "latest"
docker build --tag itwscbot:${1:-latest} .