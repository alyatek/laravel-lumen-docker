install:
ifeq (,$(wildcard .env))
	@docker-compose up -d --build
endif
