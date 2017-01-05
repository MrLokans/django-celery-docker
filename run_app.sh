#!/bin/sh

# We need to wait for postgres server to spin up
# it is better to use some kind of script trying to actually connect to the host
# but for demonstration purposes simple 'sleep' will be used

DB_TIMEOUT=1

echo "Waiting $DB_TIMEOUT seconds for the database"
sleep $DB_TIMEOUT

cd /app/celery_example

su -m djangouser -c "ls -la; python manage.py makemigrations celery_example"
su -m djangouser -c "python manage.py migrate"
su -m djangouser -c "python manage.py runserver 0.0.0.0:8000"