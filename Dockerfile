FROM alpine:3.12 AS terraform

ENV OS=linux
ENV ARCH=amd64

RUN apk add curl unzip

WORKDIR /tmp

ENV TERRAFORM_VERSION=0.14.3
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${ARCH}.zip && unzip terraform.zip

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
