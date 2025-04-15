FROM ruby:3.4.3

ARG USERNAME=app
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get update \
  && apt-get install -y sudo nodejs \
  && npm install -g yarn \
  && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

ENV BUNDLE_PATH=/app/vendor/bundle
RUN mkdir -p /app /original /persisted $BUNDLE_PATH
RUN chown -R $USERNAME /app /original /persisted $BUNDLE_PATH

ENV SHELL=/bin/bash

USER $USERNAME

WORKDIR /app
