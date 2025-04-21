build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

attach:
	docker compose exec media-info-proc bash || true


do: up attach down
