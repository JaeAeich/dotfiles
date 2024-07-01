.PHONY: docker-test
docker-test:
	@echo "Running the application..."
	@cd dotfiles && stow .
	@ansible-playbook playbooks/setup.yaml

.PHONY: dt 
dt: docker-test

.PHONY: docker
docker:
	@echo "Building the docker image..."
	@docker build -t dotfiles -f test.Dockerfile .
	@echo "Running the docker container..."
	@docker run --rm -it dotfiles bash

.PHONY: d
d: docker
