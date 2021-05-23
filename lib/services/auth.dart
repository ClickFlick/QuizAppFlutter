
import 'package:quizz_app/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userFromFirebase(User user ){
    return user != null ? UserModel(userId: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try{
      UserCredential authResult = await auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebase(firebaseUser);

    }catch(e){
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential authResult = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
      return _userFromFirebase(user);

    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async {
    try{
      return await auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}