const express = require('express')
const app = express()

app.set('port', process.env.port || 3000)

const server = app.listen(app.get('port'), ()=>{
    console.log(app.get('port'),'번 포트에서 대기 중')
})

app.get('/', (req, res)=>{
    res.send('Hello World! m***** f****! docker를 사용하고 있네요...')
})