#
# See ./CONTRIBUTING.rst
#
.PHONY: go.help

go.help:
	@echo '    go:'
	@echo ''
	@echo '        go                  help go'
	@echo '        go.make             make go binary'
	@echo '        go.run              run app'
	@echo ''

go: go.help

go.build: clean
	$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml \
		run --rm app sh -c "GOOS=linux GOARCH=amd64 go build -o main main.go"
		zip main.zip main

go.install: clean
	$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml \
		run --rm app sh -c "glide update"

go.run: clean
	$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml \
		run --rm --service-ports app sh -c "go run main.go"
