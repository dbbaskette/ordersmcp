#!/bin/bash
# Usage: ./setup_postgres.sh <host> <port> <database> <user> <password>
# Or set PGHOST, PGPORT, PGDATABASE, PGUSER, PGPASSWORD as env vars

set -e

HOST=${1:-${PGHOST:-localhost}}
PORT=${2:-${PGPORT:-5432}}
DB=${3:-${PGDATABASE:-ordersdb}}
USER=${4:-${PGUSER:-postgres}}
PASS=${5:-${PGPASSWORD:-postgres}}

export PGPASSWORD="$PASS"

MIGRATIONS_DIR="$(dirname "$0")/../src/main/resources/db/migration"

if ! command -v psql >/dev/null 2>&1; then
  echo "psql command not found. Please install PostgreSQL client tools."
  exit 1
fi

for sql in $(ls "$MIGRATIONS_DIR"/*.sql | sort); do
  echo "Applying $sql ..."
  psql -h "$HOST" -p "$PORT" -U "$USER" -d "$DB" -f "$sql"
  echo "Done."
  echo
fi

echo "All migrations applied to PostgreSQL database $DB on $HOST:$PORT." 