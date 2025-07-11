#!/bin/bash
# Usage: ./setup_h2.sh <dbfile> [<user> <password>]
# Example: ./setup_h2.sh ~/ordersdb h2user h2pass
# Requires H2 shell (h2.sh or h2.bat) to be installed and on the PATH.

set -e

DBFILE=${1:-~/ordersdb}
USER=${2:-sa}
PASS=${3:-}

MIGRATIONS_DIR="$(dirname "$0")/../src/main/resources/db/migration"

if ! command -v h2 >/dev/null 2>&1 && ! command -v h2.sh >/dev/null 2>&1; then
  echo "H2 shell (h2 or h2.sh) not found. Please install H2 and add it to your PATH."
  exit 1
fi

H2_CMD=$(command -v h2 || command -v h2.sh)

for sql in $(ls "$MIGRATIONS_DIR"/*.sql | sort); do
  echo "Applying $sql ..."
  "$H2_CMD" -url "jdbc:h2:$DBFILE" -user "$USER" -password "$PASS" -script "$sql"
  echo "Done."
  echo
fi

echo "All migrations applied to H2 database $DBFILE." 