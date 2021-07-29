import 'package:flutter/material.dart';
import 'package:flutter_api/MyHomePage.dart';
import 'package:flutter_api/pages/list_users.dart';
import 'package:flutter_api/services/user.api.dart';

class addUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Create User';
    return Container(
      child: MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              )
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: MyCustomForm(),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value of the TextField.
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  //late Future<Users> _futureUsers;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var apiUser = ApiService();
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            controller: _controllerName,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Name';
              }
              return null;
            },
            //onSubmitted: _onSubmit,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Enter an email',
              labelText: 'Email',
            ),
            controller: _controllerEmail,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.password),
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
            controller: _controllerPassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  setState(() {
                    // ignore: unused_local_variable
                    var _futureUsers = apiUser.createUser(_controllerName.text,
                        _controllerEmail.text, _controllerPassword.text);
                    // Navigator.of(context).pushNamed("login");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListUsers()),
                    );
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            'Create ' + _controllerName.text + ' successfully'),
                        // Retrieve the text the user has entered by using the
                        // TextEditingController.
                        //content: Text(_controllerName.text),
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
