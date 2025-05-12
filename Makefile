build:
	docker compose build --no-cache

up:
	docker compose up -d --force-recreate

down:
	docker compose down

attach:
	-docker compose exec media-info-proc bash


do: up attach down
