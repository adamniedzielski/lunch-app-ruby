build:
	docker-compose build

install:
	docker-compose run --rm app bundle install

test:
	docker-compose run --rm app bundle exec rake

rubocop:
	docker-compose run --rm app bundle exec rubocop

bash:
	docker-compose run --rm app bash

server:
	docker-compose run --rm --service-ports app
