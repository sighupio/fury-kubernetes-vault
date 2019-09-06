
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
	kubectl apply -k .

expose:
	kubectl port-forward -n vault svc/vault 8200:8200

vault-init:
	VAULT_ADDR=http://127.0.0.1:8200 vault operator init

destroy:
	kubectl delete -k . || exit 0
	terraform destroy || exit 0

demo-1: install init run kustomize expose
demo-2: vault-init

