import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseLoginSignup extends StatefulWidget {
  @override
  _FirebaseLoginSignupState createState() => _FirebaseLoginSignupState();
}

class _FirebaseLoginSignupState extends State<FirebaseLoginSignup> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/watercolor-cotton-candy-colors.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: usernameController.text, password: passwordController.text)
                        .then((value) async {
                      print("Successful login as " + value.user?.email);
                    }).catchError((error) {
                      print("Failed login.");
                      print(error.toString());
                    });
                  },
                  child: Text("Login")
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: usernameController.text, password: passwordController.text)
                        .then((value) {
                      print("Successful sign up");
                    }).catchError((error) {
                      print("Failed sign up");
                      print(error.toString());
                    });
                  },
                  child: Text("Signup")
              ),
            ],
          ),
        ),
      ),
    );
  }
}