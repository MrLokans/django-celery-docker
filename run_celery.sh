#!/bin/sh

RABBIT_TIMEOUT=5

echo "Waiting $RABBIT_TIMEOUT seconds for the rabbitmq"
sleep $RABBIT_TIMEOUT

cd celery_example

su -m djangouser -c "celery worker -A celery_example.celeryconfig -Q default -n default@%h"  