const express = require('express');
const router= express.Router();

const Users = require('../models/index.model');

//get All user
router.get('/', (req,res) => {
    Users.find({}, (err, users) => {
        res.json(users);
    });
});

//get a single user
router.get('/:id', (req,res,next) => {
    Users.findById(req.params.id)
    .exec(function(err, users){
        if(err) {
            res.statusCode(200).json({
                code:1,
                msg:'Error retriving user'
            });            
        }else{
            res.statusCode(200).json({
                code:0,
                msg:'data retrieved',
                data:users
            });
        }    
    });
});

//post user
router.post('/', (req,res,next) => {
   const user = new Users({
        name:req.body.name,
        email:req.body.email,
        password:req.body.password
    });

    user.save(() => {
        res.json(user);
    });
});

//user put
router.put('/:id', async(req,res,next) => {
    user = await Users.findById(req.params.id);
    user.name = req.body.name;
    user.email = req.body.email;
    user.password = req.body.password;

    user.save(() => {
        res.json(user);
    });
});

//delete user
router.delete('/:id', (req,res) => {
    Users.findByIdAndDelete(req.params.id, (err) => {
        if(err){
            res.send("Error deleting user");
        }else{
            res.json({'msg' : 'deleted'});
        }      
    });
});
/*router.delete('/:id', (req,res) => {
    Users.findByIdAndDelete(req.params.id, (err) => {
        res.json({'msg' : 'deleted'});
    });
});*/

module.exports = router;