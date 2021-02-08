create-cluster-kind:
	kind create cluster --config kind-config.yml --name vault
	kind get kubeconfig --name vault > kubeconfig

destroy-kind:
	kind delete cluster --name vault

install:
	furyctl install

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

run:
	terraform apply
	terraform output vault_backend_conf > config/backend.hcl
	terraform output vault_autounseal_conf > config/autounseal.hcl

kustomize:
	kubectl apply -k . || exit 0

expose:
	@echo execute "make demo-2" to initialize vault
	kubectl port-forward -n vault svc/vault 8200:8200

vault-init:
	VAULT_ADDR=http://127.0.0.1:8200 vault operator init
	@echo
	@echo TAKE NOTE OF THE GENERATED KEYS/TOKEN
	@echo
	@echo EXECUTE THE FOLLOWING, using the Initial Root Token as VAULT_TOKEN
	@echo export VAULT_ADDR=http://127.0.0.1:8200
	@echo export VAULT_TOKEN=

destroy:
	kubectl delete -k . || exit 0
	terraform destroy || exit 0

demo-1: install init run kustomize expose
demo-2: vault-init
