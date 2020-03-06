FROM alpine:latest


RUN apk update && apk add ca-certificates \
  jq \
  bash \
  curl \
  sshpass \
  openssh \
  openssl \
  wget \
  git \
  libc6-compat \
  bind-tools \
  coreutils

RUN wget -O /usr/local/bin/om "https://github.com/pivotal-cf/om/releases/download/0.42.0/om-linux"
RUN wget -O /usr/local/bin/spruce "https://github.com/geofffranks/spruce/releases/download/v1.18.0/spruce-linux-amd64"
RUN wget -O - "https://github.com/vmware/govmomi/releases/download/v0.18.0/govc_linux_amd64.gz" | gunzip -c > /usr/local/bin/govc
RUN wget -O /usr/local/bin/replicator "https://github.com/pivotal-cf/replicator/releases/download/0.10.0/replicator-linux"
RUN wget -O /usr/local/bin/pivnet "https://github.com/pivotal-cf/pivnet-cli/releases/download/v0.0.53/pivnet-linux-amd64-0.0.53"
RUN wget -O /usr/local/bin/winfs-injector "https://github.com/pivotal-cf/winfs-injector/releases/download/0.13.0/winfs-injector-linux"
RUN wget -O /usr/local/bin/bosh "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64"
RUN wget -O cf.tar "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" && tar xvf cf.tar && mv cf /usr/local/bin/cf && rm -r cf.tar
RUN wget -O /usr/local/bin/yaml2vault "https://s3-us-west-1.amazonaws.com/yaml2vault-pipeline/yaml2vault"
RUN wget "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.7.2/bbr-1.7.2.tar" && tar xvf bbr-1.7.2.tar && mv releases/bbr /usr/local/bin/bbr && rm -r bbr-1.7.2.tar releases
RUN wget "https://github.com/concourse/concourse/releases/download/v5.8.0/fly-5.8.0-linux-amd64.tgz" && tar xzvf fly-5.8.0-linux-amd64.tgz && mv fly /usr/local/bin/fly && rm -r fly-5.8.0-linux-amd64.tgz
RUN wget -O /usr/local/bin/safe https://github.com/starkandwayne/safe/releases/download/v0.9.3/safe-linux-amd64

RUN chmod +x /usr/local/bin/om
RUN chmod +x /usr/local/bin/spruce
RUN chmod +x /usr/local/bin/govc
RUN chmod +x /usr/local/bin/replicator
RUN chmod +x /usr/local/bin/pivnet
RUN chmod +x /usr/local/bin/winfs-injector
RUN chmod +x /usr/local/bin/bosh
RUN chmod +x /usr/local/bin/yaml2vault
RUN chmod +x /usr/local/bin/bbr
RUN chmod +x /usr/local/bin/safe
RUN chmod +x /usr/local/bin/cf
RUN chmod +x /usr/local/bin/fly
