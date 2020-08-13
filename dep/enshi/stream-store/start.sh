#!/bin/bash
CWD=$(cd "$(dirname $0)";pwd)
ulimit -n 165535
export COMPOSE_HTTP_TIMEOUT=1200
docker-compose -f ${CWD}/docker-compose.yml --project-name apps-stream-store up -d