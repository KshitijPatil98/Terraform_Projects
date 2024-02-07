Before running this male sure to enable kv secret engine on vault ui. Create a kv pair.
After that, enable the app role from ui.

Now run below commands and you should be good.
export VAULT_ADDR='http://0.0.0.0:8200'

vault policy write terraform - <<EOF

path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

EOF

vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform

vault read auth/approle/role/terraform/role-id
vault write -f auth/approle/role/terraform/secret-id


