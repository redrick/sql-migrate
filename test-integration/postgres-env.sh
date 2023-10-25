#!/bin/bash

# Tweak PATH for Travis
export PATH=$PATH:$HOME/gopath/bin

export PG_HOST=localhost
export PG_NAME=mydb
export PG_USER=postgres
export PG_PASS=password
export APP_DIR=/src/repo

OPTIONS="-config=test-integration/dbconfig.yml -env postgres_env"

set -ex

sql-migrate status $OPTIONS
sql-migrate up $OPTIONS
sql-migrate down $OPTIONS
sql-migrate redo $OPTIONS
sql-migrate status $OPTIONS
