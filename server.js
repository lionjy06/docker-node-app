import express from 'express'
import redis from 'redis'

const app = express()

const client = redis.createClient({
  socket:{
      host:'redis-server',
      port:6379
  }
})



app.get('/', async (req,res,next) => {
    await client.connect()
    let number = await client.get('number')
    if(number === null){
        number = 1
    }
    
    res.send('숫자가 1씩 증가합니다:'+ number)
    await client.set('number', +number + 1)
   
    await client.disconnect()
    
})

app.listen(3000, () => {
    console.log('server is lock and load')
})