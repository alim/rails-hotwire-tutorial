#!/bin/bash
#
# This script is used for setting up the database accounts/users that we will
# need for development and testing. It gets run once when a devcontainer is
# configured.
#
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER vscode CREATEDB;
  CREATE DATABASE vscode WITH OWNER vscode;
  CREATE USER quote_editor_dev WITH ENCRYPTED PASSWORD 'qed-dev#240501' CREATEDB;
  CREATE USER quote_editor_test WITH ENCRYPTED PASSWORD 'qed-test#240501' CREATEDB;
EOSQL
