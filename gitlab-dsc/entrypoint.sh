#!/bin/bash

config=$(test -s /etc/gitlab-runner/config.toml 2>/dev/null)
kill_it=0

if [[ ! -f /etc/gitlab-runner/config.toml ]]; then
  if [[ -z "${LIMIT}" ]]; then
    echo "Missing LIMIT env"
    kill_it=1
  fi
  if [[ -z "${GIT_URL}" ]]; then
    echo "Missing GIT_URL env"
    kill_it=1
  fi
  if [[ -z "${GIT_TOKEN}" ]]; then
    echo "Missing GIT_TOKEN env"
    kill_it=1
  fi
  if [[ -z "${GIT_SHELL}" ]]; then
    echo "Missing GIT_SHELL env"
    kill_it=1
  fi
  if [[ -z "${TAGS}" ]]; then
    echo "Missing TAGS env"
    kill_it=1
  fi
  if [[ $kill_it == 1 ]]; then
    echo "Missing env vars"
    exit 1
  fi

  # Install CA certs if they exist
  update-ca-trust

  # Run Register
  gitlab-runner register --name `hostname` --limit $LIMIT -u $GIT_URL -r $GIT_TOKEN --executor shell --shell $GIT_SHELL --tag-list $TAGS -n

else
  update-ca-trust
fi

if [[ ! -f /etc/tower/tower_cli.cfg ]]; then

  mkdir /etc/tower

  if [[ ! -z "${AWX_USER}" ]]; then
    tower-cli config --global username $AWX_USER
  fi
  if [[ ! -z "${AWX_PASS}" ]]; then
    tower-cli config --global password $AWX_PASS
  fi
  if [[ ! -z "${AWX_HOST}" ]]; then
    tower-cli config --global host $AWX_HOST
  fi
  if [[ ! -z "${AWX_VERIFY_SSL}" ]]; then
    tower-cli config --global verify_ssl $AWX_VERIFY_SSL
  fi

fi

/usr/local/bin/gitlab-runner run --working-directory /home/gitlab-runner --config /etc/gitlab-runner/config.toml --user gitlab-runner
