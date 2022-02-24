const fastify = require('fastify')({ logger: true })

// Declare a route
fastify.get('/', async (request, reply) => {
  return 'Hello FASTIFY!'
})

// Run the server!
const start = async () => {
  try {
    await fastify.listen(4000, "0.0.0.0");

    fastify.log.info(`🚀 server listening on 0.0.0.0:4000!`);
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}
start()
