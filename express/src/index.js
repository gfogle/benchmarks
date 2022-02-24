const express = require('express')
const app = express()
const port = 5000

app.get('/', (req, res) => {
  res.send('Hello EXPRESS!')
})

app.listen(port, '0.0.0.0', () => {
  console.log(`🚀 server listening on 0.0.0.0:5000!`)
})
