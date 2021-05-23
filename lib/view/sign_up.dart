import 'package:flutter/material.dart';
import 'package:quizz_app/helper/functions.dart';
import 'package:quizz_app/services/auth.dart';
import 'package:quizz_app/view/home.dart';
import 'package:quizz_app/view/sign_in.dart';
import 'package:quizz_app/widgets/widgets.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name,email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
       authService.signUpWithEmailAndPassword(email, password).then((value) {
        if(value != null){
          setState(() {
            _isLoading = false;
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
      body: _isLoading ? Container(
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
                  return val.isEmpty ? "Enter correct name!" : null;
                },
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (val) {
                  name = val;
                },
              ),
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
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  signUp();
                },
                child: blueButton( context: context,
                    buttonText: 'Sign Up',
                    buttonWidth: null)
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                    },

                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 15,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )

            ],
          ),
        ),
      ),
    );
  }
}
