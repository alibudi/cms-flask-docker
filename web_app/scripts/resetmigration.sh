#!/bin/sh
alembic downgrade base
rm -rf migrations/versions/*
alembic revision --autogenerate -m 'intial db'
alembic upgrade head
python ./web_app/scripts/initializedb.py