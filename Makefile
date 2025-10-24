install:
	which minikube > /dev/null || brew install minikube

deploy:
	minikube start --driver=docker

install-helm:
	helm upgrade --install spam3000 helm/spam-test

uninstall-helm:
	helm uninstall spam3000

all: install deploy install-helm
