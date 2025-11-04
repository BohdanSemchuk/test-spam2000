install-minikube:
	which minikube > /dev/null || brew install minikube

delete-minikube:
	minikube delete || true 

stop-minikube:
	minikube stop

start-minikube:
	minikube start --driver=docker

install-argocd:
	kubectl create namespace argocd || true
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

install-spam:
	cd helm/spam-test/ && helm dependency build
	helm upgrade --install --atomic spam3000 helm/spam-test --timeout 10m

uninstall-spam:
	helm uninstall spam3000 || true

clean: uninstall-spam 

clean-full: clean stop-minikube delete-minikube

all: install-minikube start-minikube install-argocd install-spam
