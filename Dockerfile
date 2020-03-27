ARG BASE_REGISTRY=nexus-docker-secure.levelup-nexus.svc.cluster.local:18082
ARG BASE_IMAGE=redhat/ubi/ubi7
ARG BASE_TAG=7.8

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

LABEL name="Rancher Flannel CNI for RKE" \
      maintainer="adam.toy@rancherfederal.com" \
      vendor="Rancher" \
      version="0.3.0" \
      release="1" \
      summary="Flannel CI for Rancher RKE" \
      description="Flannel CI for Rancher RKE"

USER root

COPY LICENSE /licenses/flannel-cni
ADD ./cni-plugins.tgz /opt/cni/bin
ADD ./cni.tgz /opt/cni/bin
ADD install-cni.sh /install-cni.sh
ADD flannel.conflist.default /flannel.conflist.default

RUN chown -R 2000:2000 /licenses && \
    chown -R 2000:2000 /opt/cni && \
    chown 2000:2000 /install-cni.sh /flannel.conflist.default

USER 2000