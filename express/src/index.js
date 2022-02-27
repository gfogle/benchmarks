const express = require('express')
const app = express()
const port = 5000

app.get('/', async (req, res) => {
  res.send('Hello EXPRESS!')
})

// Run the server!
const start = async () => {
  try {
    app.listen(port, '0.0.0.0', () => {
      console.log(`🚀 server listening on 0.0.0.0:5000!`)
    })
  } catch (err) {
    console.error(err)
    process.exit(1)
  }
}
start()
