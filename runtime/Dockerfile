ARG AP_VERSION=3.7
ARG GP_VERSION=v0.7.13
ARG TF_VERSION=0.11.13

FROM geopoiesis/geopoiesis:${GP_VERSION} as geopoiesis
FROM hashicorp/terraform:${TF_VERSION} as terraform
FROM alpine:${AP_VERSION}

RUN apk add --no-cache \
  curl \
  ca-certificates \
  openssh-client

COPY --from=geopoiesis /geopoiesis /usr/bin/
COPY --from=terraform /bin/terraform /usr/bin/
COPY config.hcl /etc/geopoiesis/

USER 1000
ENTRYPOINT ["geopoiesis"]
CMD ["--config=/etc/geopoiesis/config.hcl"]
