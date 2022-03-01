
.PHONY: es4x express fastify quarkus spring vertx

all:
	make es4x && \
	make express && \
	make fastify && \
	make quarkus && \
	make spring && \
	make vertx

es4x:
	docker build -t es4x -f ./es4x/Dockerfile ./es4x && \
	docker run --rm -it -d --name es4x -p3000:3000 es4x:latest

bench-es4x:
	./node_modules/.bin/autocannon http://localhost:3000 -d 30
bench-es4x-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:3000

express:
	docker build -t express -f ./express/Dockerfile ./express && \
	docker run --rm -it -d --name express -p5000:5000 express:latest

bench-express:
	./node_modules/.bin/autocannon http://localhost:5000 -d 30
bench-express-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:5000

fastify:
	docker build -t fastify -f ./fastify/Dockerfile ./fastify && \
	docker run --rm -it -d --name fastify -p4000:4000 fastify:latest

bench-fastify:
	./node_modules/.bin/autocannon http://localhost:4000 -d 30
bench-fastify-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:4000

stop:
	docker stop es4x && docker stop fastify && docker stop express


quarkus:
	docker build -t quarkus -f ./quarkus/Dockerfile ./quarkus && \
	docker run --rm -it -d --name quarkus -p7000:7000 quarkus:latest

bench-quarkus:
	./node_modules/.bin/autocannon http://localhost:7000/h -d 30
bench-quarkus-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:7000/h

spring:
	docker build -t spring -f ./spring/Dockerfile ./spring && \
	docker run --rm -it -d --name spring -p8000:8000 spring:latest

bench-spring:
	./node_modules/.bin/autocannon http://localhost:8000 -d 30
bench-spring-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:8000

vertx:
	docker build -t vertx -f ./vertx/Dockerfile ./vertx && \
	docker run --rm -it -d --name vertx -p6000:6000 vertx:latest

bench-vertx:
	./node_modules/.bin/autocannon http://localhost:6000 -d 30
bench-vertx-heavy:
	./node_modules/.bin/autocannon -c 1000 -d 90 http://localhost:6000
