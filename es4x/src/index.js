/// <reference types="@vertx/core" />
// @ts-check

vertx
  .createHttpServer()
  .requestHandler(function (req) {
    req.response().end("Hello ES4X!");
  })
  .listen(3000, '0.0.0.0');

console.log(`🚀 server listening on 0.0.0.0:3000!`);
