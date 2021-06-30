const mongoose = require('mongoose');

//mongoose.Promise = global.Promise();

const url = "mongodb://localhost:27017/flutterApp";

//connect mongoDB at default port 27017
//let mong = mongoose.connect('mongodb://localhost:27017/flutterApp', {useUnifiedTopology: true, useNewUrlParser: true})
let mong = mongoose.connect(url, {useUnifiedTopology: true, useNewUrlParser: true},(err) => {
    if(!err){
        console.log('MongoDB connection succeeded.');
    }else{
        console.log('Error in DB connection: ' + err);
    }
});
