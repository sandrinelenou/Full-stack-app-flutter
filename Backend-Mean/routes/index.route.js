const express = require('express');
const mongoose = require('mongoose');
const router= express.Router();

const Users = require('../models/index.model');

//get All user
router.get('/list', (req,res) => {
    Users.find({}, (err, users) => {
       if(err){
        res.json({
            code:1,
            msg:"Users fetch with error",
            data: []
        });
       }else{
        res.json({
            code:0,
            msg:"Users fetch successfully",
            data: users
        });
       }
    });
});

//get a single user
router.get('/:id', (req,res,next) => {
    Users.findById(req.params.id)
    .exec(function(err, users){
        if(err) {
            res.status(200).json({
                code:1,
                msg:'Error retriving user'
            });            
        }else{
            res.status(200).json({
                code:0,
                msg:'data retrieved',
                data:users
            });
        }    
    });
});

//post user
router.post('/create', (req,res,next) => {
   const user = new Users({
        name:req.body.name,
        email:req.body.email,
        password:req.body.password
    });

    user.save(() => {
        res.json(user);
    });
});

//update video
/*router.put("/update/:id", function (req, res) {  
    Users.findByIdAndUpdate(req.params.id,
      {
        $set: { name: req.body.name, email: req.body.email, password: req.body.password }
      },
      { new: true },
      function (err, updatedUser) {
        if (err) {
            res.status(500).json({
                code:1,
                message: "Error updating User"
            });
        } else {
            res.status(200).json({
                code: 0,
                message: "Update user successfully" ,
                 data: user
            });
        }
      }
    );
  });*/
//update user good
router.put("/update/:id", (req,res,next) => {
   
    const user = new Users({
        _id: req.params.id,
        name: req.body.name,
        email: req.body.email,
        password: req.body.password
    });
    
    Users.updateOne( {_id:req.params.id}, user).
    then(result => {
        if(result){
           res.status(200).json({
               code: 0,
               message: "Update user successfully" ,
                data: user
           });
        }else{
            res.status(500).json({
                code:1,
                message: "Error updating User"
            });
        }         
    });
});

//user put
/*router.put('/update/:id', async(req,res,next) => {
    user = await Users.findById(req.params.id);
    user.name = req.body.name;
    user.email = req.body.email;
    user.password = req.body.password;

    user.save(() => {
        res.json(user);
    });
});*/

//delete user good
/*router.delete('/delete/:id', (req,res) => {
    Users.findByIdAndDelete(req.params.id, (err) => {
        if(err){
            res.send("Error deleting user");
        }else{
            res.json({'msg' : 'deleted'});
        }      
    });
});*/

//delete user good
router.delete("/delete/:id", (req,res,next) => {
    Users.deleteOne({ _id: req.params.id }).then(result => {
       if (!result) {
           res.status(200).json({
             code: 1,
             message: "User was not deleted!"
           });
         }
         res.status(200).json({
           code:0 ,
           message: "User deleted!"
         });
       });   
});

module.exports = router;