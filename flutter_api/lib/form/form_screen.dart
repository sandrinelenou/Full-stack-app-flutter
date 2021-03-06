import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormScreen extends StatefulWidget {
  String id;
  String name;
  String email;
  String password;

  FormScreen(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  /* @override
  void initState() {}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Name'),
                  keyboardType: TextInputType.text,
                  controller: _controllerName,
                  // The validator receives the text that the user has entered.
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },*/
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerEmail,
                  /*
                   validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                  * */
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  controller: _controllerPassword,
                  /*validator: (value) {
                      if (value.isEmpty && value.length < 7) {
                        return 'Invalid password!';
                      }
                    },*/
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                widget.id == ''
                    ? ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          /* String name: _controllerName.text.toString().trim();
                       String email: _controllerEmail.text.toString().trim();
                       String password: _controllerPassword.text.toString().trim();
                       if(name.isEmpty){

                       }*/
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the user has entered by using the
                                // TextEditingController.
                                content: Text(_controllerName.text),
                              );
                            },
                          );
                        })
                    : ElevatedButton(child: Text('Update '), onPressed: () {}),
              ],
            ),
          ),
        )

        // ignore: unnecessary_null_comparison
        /* body: (widget.id == '')
            ? Center( child: Text('Hello form'))
            : Center(child: Text('Edit data'))
    );*/
        );
  }
}
