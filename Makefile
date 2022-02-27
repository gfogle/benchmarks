
.PHONY: es4x express fastify quarkus vertx

es4x:
	docker build -t es4x -f ./es4x/Dockerfile ./es4x && \
	docker run --rm -it -d --name es4x -p3000:3000 es4x:latest

bench-es4x:
	./node_modules/.bin/autocannon http://localhost:3000 -d 30


express:
	docker build -t express -f ./express/Dockerfile ./express && \
	docker run --rm -it -d --name express -p5000:5000 express:latest

bench-express:
	./node_modules/.bin/autocannon http://localhost:5000 -d 30


fastify:
	docker build -t fastify -f ./fastify/Dockerfile ./fastify && \
	docker run --rm -it -d --name fastify -p4000:4000 fastify:latest

bench-fastify:
	./node_modules/.bin/autocannon http://localhost:4000 -d 30

stop:
	docker stop es4x && docker stop fastify && docker stop express


quarkus:
	docker build -t quarkus -f ./quarkus/Dockerfile ./quarkus && \
	docker run --rm -it -d --name quarkus -p7000:7000 quarkus:latest

bench-quarkus:
	./node_modules/.bin/autocannon http://localhost:7000/h -d 30

vertx:
	docker build -t vertx -f ./vertx/Dockerfile ./vertx && \
	docker run --rm -it -d --name vertx -p6000:6000 vertx:latest

bench-vertx:
	./node_modules/.bin/autocannon http://localhost:6000 -d 30
