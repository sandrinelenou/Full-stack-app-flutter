const bodyParser = require('body-parser');
const express = require('express');
const cors = require('cors');

//const db = require('./database/db');
const mongoose = require('mongoose');
const url = "mongodb://localhost:27017/test";   //mongodb://localhost:27017/test o flutterApp
let mong = mongoose.connect(url, {useUnifiedTopology: true, useNewUrlParser: true},(err) => {
    if(!err){
        console.log('MongoDB connection succeeded.');
    }else{
        console.log('Error in DB connection: ' + err);
    }
});

const app = express();

app.use(bodyParser.urlencoded({extended:true}));
app.use(express.json());
app.use(cors());

app.use('/', require('./routes/index.route'));

const port = 3000 | process.env.PORT ;

app.listen(port, (req,res) => {
    console.log('app is listening on port: '+ port);
});
