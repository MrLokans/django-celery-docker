import os

from celery import Celery
from django.conf import settings


app = Celery('celery_example')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "celery_example.settings")

CELERY_TIMEZONE = 'UTC'

app.config_from_object(settings)
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
