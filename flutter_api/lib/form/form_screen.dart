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
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerEmail,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  controller: _controllerPassword,
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                widget.id == ''
                    ? RaisedButton(child: Text('Submit'), onPressed: () {})
                    : RaisedButton(child: Text('Update '), onPressed: () {}),
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
