import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}
// test 
class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin : EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            // 'correct' way to give padding between submit and password
            Container(
              margin: EdgeInsets.all(10.0),
            ),
            submitButton(),
          ],
        )
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Adress',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false, // should change this later
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      validator: validatePassword, 
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(password);
          print(email);
        }
      },
    );
  }
}