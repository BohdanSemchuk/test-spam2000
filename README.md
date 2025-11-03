# test-spam2000

## spam3000 Implementation

The spam3000 implementation is an enhanced version of spam2000, with monitoring and dashboards.
Monitoring was enabled by using victoria-metrics-k8s-stack as a dependency chart.

Spam3000 uses ArgoCD to respect GitOps practice, it is installed in Makefile via:
```Makefile
install-argocd:
	kubectl create namespace argocd || true
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Now after gitignoring Chart.lock we run helm dependency build before using helm chart.
```Makefile
install-spam:
	cd helm/spam-test/ && helm dependency build
	helm upgrade --install spam3000 helm/spam-test
```

### About
To get started, run the following command to install Minikube for macOS using Homebrew:

```bash
make all
```

It will install minikube and deploy helm chart locally.

### Dashboard Examples

Here are examples of the dashboards available in spam3000:

![Kubernetes Dashboard](images/k8s-dash.png)

![Spam3000 Dashboard](images/spam3000-dash.png)

GitHub Actions part was deleted for now.