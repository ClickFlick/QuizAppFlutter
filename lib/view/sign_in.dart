
import 'package:flutter/material.dart';
import 'package:quizz_app/helper/functions.dart';
import 'package:quizz_app/services/auth.dart';
import 'package:quizz_app/view/home.dart';
import 'package:quizz_app/view/sign_up.dart';
import 'package:quizz_app/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();
  bool isLoading = false;

  signIn() async {
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((value){
        if(value != null){
          setState(() {
            isLoading = false;
          });
          HelperFunctions.saveUserLoggedIn(isLoggedIn: true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: isLoading ? Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
      ) : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter correct email!" : null;
                },
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.isEmpty ? "Enter correct password!" : null;
                },
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: blueButton(
                    context: context,
                    buttonText: 'Sign in',
                    buttonWidth: null
                )
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
