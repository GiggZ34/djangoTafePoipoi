sleep 5
python manage.py migrate --noinput
python manage.py collectstatic --noinput
sh -c "python manage.py runserver 0.0.0.0:8000"
