#!/bin/sh

cli_args=

if [ -n "${WERCKER_TERRAFORM_VAR_FILE}" ]; then
  cli_args="$cli_args -var-file=${WERCKER_TERRAFORM_VAR_FILE}"
fi

terraform_cli="${WERCKER_STEP_ROOT}/terraform"

if [ -n "${WERCKER_TERRAFORM_REMOTE_CONFIG}" ]; then
  $terraform_cli remote config "$(echo "${WERCKER_TERRAFORM_REMOTE_CONFIG}")"
fi

$terraform_cli "$(echo "${WERCKER_TERRAFORM_COMMAND} $cli_args")"
