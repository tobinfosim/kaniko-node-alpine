FROM gcr.io/kaniko-project/executor:debug AS kaniko
FROM node:16.16.0-alpine

# taken from here: https://stackoverflow.com/questions/69182455/possible-to-add-kaniko-to-alpine-image-or-add-jq-to-kaniko-image
COPY --from=kaniko /kaniko/ /kaniko/

ENV PATH $PATH:/usr/local/bin:/kaniko
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json
ENV SSL_CERT_DIR /kaniko/ssl/certs

#ENTRYPOINT ["/kaniko/executor"]
