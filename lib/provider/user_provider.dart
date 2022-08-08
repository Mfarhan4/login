import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier{
  UserCredential? _result;
  String? _user="";
  FirebaseAuth _auth=FirebaseAuth.instance;
  singUp(String email,String password) async {
     _result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if(_result!.user!=null){
    debugPrint(" result ${_result!.user}");
    _user=_result!.user!.uid;
    }


    else{
      debugPrint("user null");
    }
  }
  singIn(String email,String password) async {
    _result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(_result!.user!=null){
      debugPrint(" result ${_result!.user}");
      _user=_result!.user!.uid;
    }


    else{
      debugPrint("user null");
    }
  }
  String? get user => _user;
}