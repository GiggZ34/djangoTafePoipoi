sleep 5
python manage.py migrate --noinput
sh -c "RELEASE=MY_VERSION gunicorn --bind=[::]:${PORT} --workers=5 --threads=10 main.wsgi"
