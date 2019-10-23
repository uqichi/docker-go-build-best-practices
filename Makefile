build:
	docker build -t go-server .

run:
	docker container run -p 5555:5555 go-server
