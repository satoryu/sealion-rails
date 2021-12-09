FROM ruby:3.0.3-bullseye

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential curl git libpq-dev postgresql \
    && apt-get clean

# Install Docker
# Ref: https://matsuand.github.io/docs.docker.jp.onthefly/engine/install/debian/
RUN apt-get update \
    && apt-get -y install --no-install-recommends ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
         | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get -y install --no-install-recommends docker-ce docker-ce-cli containerd.io \
    && apt-get clean

# Install Chrome Headless
RUN apt-get update \
    && curl -fSLO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get update && apt-get install -f -y

ENV GEM_HOME /bundle
ENV BUNDLE_PATH ${GEM_HOME}
ENV BUNDLE_APP_CONFIG ${BUNDLE_PATH}
ENV BUNDLE_BIN ${BUNDLE_PATH}/bin
ENV PATH /workspace/bin:${BUNDLE_PATH}:$PATH

EXPOSE 3000
