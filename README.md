# Redpanda Telemetry Module

This Helm Chart enables self-managed customers to stream Redpanda cluster metrics and logs to the Redpanda Telemetry
Service.

> [!TIP]
> Access to the Telemetry Service is controlled. Please contact Redpanda for access!

# Installation

## Prerequisites

Create the following secret, which encapsulates the access credentials for your local cluster:

```bash
kubectl create secret generic source -n ${NAMESPACE} \
--from-literal=mechanism=<sasl mechanism from your cluster> \
--from-literal=username=<username from your cluster> \
--from-literal=password=<password from your cluster>
```

These credentials are used to connect to Redpanda in order to determine the cluster and node IDs.

Then, create a secret that contains the credentials needed to access the Redpanda Telemetry Service: 

```bash

kubectl create secret generic destination -n ${NAMESPACE} \
--from-literal=mechanism=<sasl mechanism supplied by Redpanda Support> \
--from-literal=username=<username supplied by Redpanda Support> \
--from-literal=password=<password supplied >
```

> [!TIP]
>! Be sure to use the client ID supplied by Redpanda - this is used for quota management

## Helm Chart

In order to use this beta, clone the git repo in order to access the Helm Chart, then customise values.yaml as required.

```bash
git clone https://github.com/pmwrp/telemetry.git
cd telemetry
# customise values.yaml

NAMESPACE=redpanda
helm install -n ${NAMESPACE} telemetry .
```

