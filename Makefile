.DEFAULT_GOAL := default

IMAGE ?= yeya24/native-histogram-app:demo

.PHONY: publish # Push the image to the remote registry
publish:
	docker buildx build \
		--platform linux/amd64,linux/arm64/v8 \
		--output "type=image,push=true" \
		--tag $(IMAGE) \
		.
