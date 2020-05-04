# PagePerso@Kubernetes

This repository contains scripts and configuration files that helped
me to host my personal website on Kubernetes. The purpose of this
work was to understand the concepts involved in an application
running on Kubernetes.

## Objective

- Make a website hosted on Dropbox available online
- Learn the basics of Kubernetes
- Use a commercial Kubernetes service (Scaleway's Kapsule)

## Prerequisites

- a Dropbox account
- a valid domain name

## Steps (15 minutes)

### 0) Create a Kubernetes cluster on Scaleway

### 1) Create an access Token for your dropbox account

### 2) Create a secret on Kubernetes that contains the Dropbox's access token

```shell
kubectl create secret generic pageperso-secrets --from-literal=DROPBOX_ACCESS_TOKEN=<TOKEN>
```

### 3) Deploy the 'pageperso' application

```shell
kubectl apply -f pageperso.yaml
```

### 4) Test it!

### 5) (bonus) Configure a domain name

#### a) Install cert-manager

According to the [official documentation](https://cert-manager.io/docs/installation/kubernetes/#installing-with-regular-manifests) of cert-manager, do the following:

```shell
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.3/cert-manager.yaml
```

Replace the email adress in the `let_encrypt_issuer.yaml` file and run the command:
```shell
kubectl apply -f let_encrypt_issuer.yaml
```

## Contact

Feel free to contact me or to open an issue.
