-include .env

build:
	docker compose build

run: network
	docker compose up -d

network:
	docker network create -d bridge tafe-poipoi-network || true

createsuperuser:
	docker compose exec backend python manage.py createsuperuser

test:
	docker compose exec backend python -m flake8 --exclude=apps/__init__.py --statistics --max-line-length=120
	docker compose exec backend python manage.py test

shell:
	docker compose exec backend python manage.py shell

logs:
	docker compose logs -f --tail 5

db:
	docker compose exec db psql -d ${POSTGRES_DB} -U ${POSTGRES_USER}

db_update:
	docker compose exec backend python manage.py makemigrations
	docker compose exec backend python manage.py migrate

clean:
	docker compose down

fclean:
	docker compose down --remove-orphans --rmi "local" -v
	docker network rm tafe-poipoi-network || true
	rm -r ./static || true

.PHONY: build run test shell logs db clean fclean network
.SILENT: build run test shell logs db clean fclean network
.DEFAULT_GOAL := run
