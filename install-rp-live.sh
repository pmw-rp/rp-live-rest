# Your redpanda namespace
NAMESPACE=green

#kubectl create secret generic source -n ${NAMESPACE} \
#--from-literal=mechanism=<sasl mechanism from your cluster> \
#--from-literal=username=<username from your cluster> \
#--from-literal=password=<password from your cluster>

kubectl create secret generic destination -n ${NAMESPACE} \
--from-literal=username=<redacted> \
--from-literal=password=<redacted>

helm install rp-live ./rp-live --namespace ${NAMESPACE}