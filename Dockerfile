FROM alpine:3.12 AS terraform

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl unzip

WORKDIR /tmp

ENV TERRAFORM_VERSION=0.14.3
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${ARCH}.zip && unzip terraform.zip

FROM alpine:3.12 AS providers

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl unzip

WORKDIR /tmp

ENV EXTERNAL_PROVIDER_VERSION=2.0.0
RUN curl -o terraform-provider-external.zip https://releases.hashicorp.com/terraform-provider-external/${EXTERNAL_PROVIDER_VERSION}/terraform-provider-external_${EXTERNAL_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-external.zip && mkdir -p providers/hashicorp/external/${EXTERNAL_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-external_* providers/hashicorp/external/${EXTERNAL_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV ARCHIVE_PROVIDER_VERSION=2.0.0
RUN curl -o terraform-provider-archive.zip https://releases.hashicorp.com/terraform-provider-archive/${ARCHIVE_PROVIDER_VERSION}/terraform-provider-archive_${ARCHIVE_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-archive.zip && mkdir -p providers/hashicorp/archive/${ARCHIVE_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-archive_* providers/hashicorp/archive/${ARCHIVE_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV BOUNDARY_PROVIDER_VERSION=0.1.0
RUN curl -o terraform-provider-boundary.zip https://releases.hashicorp.com/terraform-provider-boundary/${BOUNDARY_PROVIDER_VERSION}/terraform-provider-boundary_${BOUNDARY_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-boundary.zip && mkdir -p providers/hashicorp/boundary/${BOUNDARY_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-boundary_* providers/hashicorp/boundary/${BOUNDARY_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV CLOUDINIT_PROVIDER_VERSION=2.1.0
RUN curl -o terraform-provider-cloudinit.zip https://releases.hashicorp.com/terraform-provider-cloudinit/${CLOUDINIT_PROVIDER_VERSION}/terraform-provider-cloudinit_${CLOUDINIT_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-cloudinit.zip && mkdir -p providers/hashicorp/cloudinit/${CLOUDINIT_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-cloudinit_* providers/hashicorp/cloudinit/${CLOUDINIT_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV CONSUL_PROVIDER_VERSION=2.10.1
RUN curl -o terraform-provider-consul.zip https://releases.hashicorp.com/terraform-provider-consul/${CONSUL_PROVIDER_VERSION}/terraform-provider-consul_${CONSUL_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-consul.zip && mkdir -p providers/hashicorp/consul/${CONSUL_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-consul_* providers/hashicorp/consul/${CONSUL_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV DNS_PROVIDER_VERSION=3.0.0
RUN curl -o terraform-provider-dns.zip https://releases.hashicorp.com/terraform-provider-dns/${DNS_PROVIDER_VERSION}/terraform-provider-dns_${DNS_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-dns.zip && mkdir -p providers/hashicorp/dns/${DNS_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-dns_* providers/hashicorp/dns/${DNS_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV DOCKER_PROVIDER_VERSION=2.7.2
RUN curl -o terraform-provider-docker.zip https://releases.hashicorp.com/terraform-provider-docker/${DOCKER_PROVIDER_VERSION}/terraform-provider-docker_${DOCKER_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-docker.zip && mkdir -p providers/hashicorp/docker/${DOCKER_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-docker_* providers/hashicorp/docker/${DOCKER_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV GRAFANA_PROVIDER_VERSION=1.8.0
RUN curl -o terraform-provider-grafana.zip https://releases.hashicorp.com/terraform-provider-grafana/${GRAFANA_PROVIDER_VERSION}/terraform-provider-grafana_${GRAFANA_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-grafana.zip && mkdir -p providers/hashicorp/grafana/${GRAFANA_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-grafana_* providers/hashicorp/grafana/${GRAFANA_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV HELM_PROVIDER_VERSION=2.0.1
RUN curl -o terraform-provider-helm.zip https://releases.hashicorp.com/terraform-provider-helm/${HELM_PROVIDER_VERSION}/terraform-provider-helm_${HELM_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-helm.zip && mkdir -p providers/hashicorp/helm/${HELM_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-helm_* providers/hashicorp/helm/${HELM_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV HTTP_PROVIDER_VERSION=2.0.0
RUN curl -o terraform-provider-http.zip https://releases.hashicorp.com/terraform-provider-http/${HTTP_PROVIDER_VERSION}/terraform-provider-http_${HTTP_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-http.zip && mkdir -p providers/hashicorp/http/${HTTP_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-http_* providers/hashicorp/http/${HTTP_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV KUBERNETES_PROVIDER_VERSION=1.13.3
RUN curl -o terraform-provider-kubernetes.zip https://releases.hashicorp.com/terraform-provider-kubernetes/${KUBERNETES_PROVIDER_VERSION}/terraform-provider-kubernetes_${KUBERNETES_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-kubernetes.zip && mkdir -p providers/hashicorp/kubernetes/${KUBERNETES_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-kubernetes_* providers/hashicorp/kubernetes/${KUBERNETES_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV KUBERNETES_ALPHA_PROVIDER_VERSION=0.2.1
RUN curl -o terraform-provider-kubernetes-alpha.zip https://releases.hashicorp.com/terraform-provider-kubernetes-alpha/${KUBERNETES_ALPHA_PROVIDER_VERSION}/terraform-provider-kubernetes-alpha_${KUBERNETES_ALPHA_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-kubernetes-alpha.zip && mkdir -p providers/hashicorp/kubernetes-alpha/${KUBERNETES_ALPHA_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-kubernetes-alpha_* providers/hashicorp/kubernetes-alpha/${KUBERNETES_ALPHA_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV LOCAL_PROVIDER_VERSION=2.0.0
RUN curl -o terraform-provider-local.zip https://releases.hashicorp.com/terraform-provider-local/${LOCAL_PROVIDER_VERSION}/terraform-provider-local_${LOCAL_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-local.zip && mkdir -p providers/hashicorp/local/${LOCAL_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-local_* providers/hashicorp/local/${LOCAL_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV NULL_PROVIDER_VERSION=3.0.0
RUN curl -o terraform-provider-null.zip https://releases.hashicorp.com/terraform-provider-null/${NULL_PROVIDER_VERSION}/terraform-provider-null_${NULL_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-null.zip && mkdir -p providers/hashicorp/null/${NULL_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-null_* providers/hashicorp/null/${NULL_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV RUNDECK_PROVIDER_VERSION=0.4.0
RUN curl -o terraform-provider-rundeck.zip https://releases.hashicorp.com/terraform-provider-rundeck/${RUNDECK_PROVIDER_VERSION}/terraform-provider-rundeck_${RUNDECK_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-rundeck.zip && mkdir -p providers/hashicorp/rundeck/${RUNDECK_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-rundeck_* providers/hashicorp/rundeck/${RUNDECK_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV TEMPLATE_PROVIDER_VERSION=2.2.0
RUN curl -o terraform-provider-template.zip https://releases.hashicorp.com/terraform-provider-template/${TEMPLATE_PROVIDER_VERSION}/terraform-provider-template_${TEMPLATE_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-template.zip && mkdir -p providers/hashicorp/template/${TEMPLATE_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-template_* providers/hashicorp/template/${TEMPLATE_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV TERRAFORM_PROVIDER_VERSION=1.0.2
RUN curl -o terraform-provider-terraform.zip https://releases.hashicorp.com/terraform-provider-terraform/${TERRAFORM_PROVIDER_VERSION}/terraform-provider-terraform_${TERRAFORM_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-terraform.zip && mkdir -p providers/hashicorp/terraform/${TERRAFORM_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-terraform_* providers/hashicorp/terraform/${TERRAFORM_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV TIME_PROVIDER_VERSION=0.6.0
RUN curl -o terraform-provider-time.zip https://releases.hashicorp.com/terraform-provider-time/${TIME_PROVIDER_VERSION}/terraform-provider-time_${TIME_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-time.zip && mkdir -p providers/hashicorp/time/${TIME_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-time_* providers/hashicorp/time/${TIME_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV TLS_PROVIDER_VERSION=3.0.0
RUN curl -o terraform-provider-tls.zip https://releases.hashicorp.com/terraform-provider-tls/${TLS_PROVIDER_VERSION}/terraform-provider-tls_${TLS_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-tls.zip && mkdir -p providers/hashicorp/tls/${TLS_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-tls_* providers/hashicorp/tls/${TLS_PROVIDER_VERSION}/${OS}_${ARCH}/

ENV VAULT_PROVIDER_VERSION=2.17.0
RUN curl -o terraform-provider-vault.zip https://releases.hashicorp.com/terraform-provider-vault/${VAULT_PROVIDER_VERSION}/terraform-provider-vault_${VAULT_PROVIDER_VERSION}_${OS}_${ARCH}.zip && unzip terraform-provider-vault.zip && mkdir -p providers/hashicorp/vault/${VAULT_PROVIDER_VERSION}/${OS}_${ARCH} && mv terraform-provider-vault_* providers/hashicorp/vault/${VAULT_PROVIDER_VERSION}/${OS}_${ARCH}/


FROM alpine:3.12 AS vault

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl unzip

WORKDIR /tmp

ENV VAULT_VERSION=1.6.1
RUN curl -o vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${OS}_${ARCH}.zip && unzip vault.zip

FROM alpine:3.12 AS kubectl

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl unzip

WORKDIR /tmp

ENV KUBECTL_VERSION=1.19.4
RUN curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/${OS}/${ARCH}/kubectl && chmod +x kubectl

FROM alpine:3.12 AS helm

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl

WORKDIR /tmp

ENV HELM_VERSION=3.4.2
RUN curl -o helm.tar.gz https://get.helm.sh/helm-v${HELM_VERSION}-${OS}-${ARCH}.tar.gz && tar -xzf helm.tar.gz && mv ${OS}-${ARCH} helm

FROM alpine:3.12 AS stern

ENV OS=linux
ENV ARCH=amd64

RUN apk add wget

WORKDIR /tmp

ENV STERN_VERSION=1.11.0
RUN wget https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_${OS}_${ARCH} && mv stern_${OS}_${ARCH} stern && chmod +x stern

FROM alpine:3.12 AS yq

ENV OS=linux
ENV ARCH=amd64

RUN apk add wget

WORKDIR /tmp

ENV YQ_VERSION=4.1.0
RUN wget https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_${OS}_${ARCH} && mv yq_${OS}_${ARCH} yq && chmod +x yq

FROM alpine:3.12 AS jq

ENV OS=linux
ENV SHORT_ARCH=64

RUN apk add wget

WORKDIR /tmp

ENV JQ_VERSION=1.6
RUN wget https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-${OS}${SHORT_ARCH} && mv jq-${OS}${SHORT_ARCH} jq && chmod +x jq

FROM alpine:3.12 AS yj

ENV OS=linux
ENV YJ_ARCH=""

RUN apk add wget

WORKDIR /tmp

ENV YJ_VERSION=5.0.0
RUN wget https://github.com/sclevine/yj/releases/download/v${YJ_VERSION}/yj-${OS}${YJ_ARCH} && mv yj-${OS}${YJ_ARCH} yj && chmod +x yj

FROM alpine:3.12

RUN apk add bash bash-doc bash-completion
RUN sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd
COPY aliases.sh /etc/profile.d/
COPY ps1.sh /etc/profile.d/
ENV ENV="/etc/profile"

RUN apk add curl wget

RUN apk add python3=3.8.5-r0
RUN apk add openssh-client
RUN apk add ansible=2.9.14-r0 ansible-doc ansible-lint

RUN apk add mtr nmap bind-tools tcpdump iperf iperf3

RUN echo "default:x:1000:default" >> /etc/group
RUN echo "default:x:1000:1000:default:/home/default:/bin/bash" >> /etc/passwd
RUN mkdir -p /home/default && chown -R 1000:1000 /home/default

COPY --from=terraform /tmp/terraform /usr/local/bin/
COPY --from=vault /tmp/vault /usr/local/bin/
COPY --from=kubectl /tmp/kubectl /usr/local/bin/
COPY --from=helm /tmp/helm/helm /usr/local/bin/
COPY --from=stern /tmp/stern /usr/local/bin/
COPY --from=yq /tmp/yq /usr/local/bin/
COPY --from=jq /tmp/jq /usr/local/bin/
COPY --from=yj /tmp/yj /usr/local/bin/

RUN mkdir -p /root/.local/share/terraform/plugins/registry.terraform.io
COPY --from=providers /tmp/providers/* /root/.local/share/terraform/plugins/registry.terraform.io/
