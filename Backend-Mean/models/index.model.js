const mongoose= require('mongoose');
const Schema =  mongoose.Schema;

const newSchema = new Schema({
    name:String,
    email:String,
    password:String
});

module.exports = mongoose.model('Users', newSchema);

