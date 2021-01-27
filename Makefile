PLATFORMS=linux/amd64,linux/arm64,linux/arm,linux/ppc64le
PREFIX=
IMAGE_VER=1.0

images: Dockerfile
	docker buildx build --push --platform $(PLATFORMS) -t $(PREFIX)/rt-tests:$(IMAGE_VER) .
