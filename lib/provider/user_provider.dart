import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:login_projects/dialog/dialog.dart';

class UserProvider extends ChangeNotifier{
  UserCredential? _result;
  User? _user;
  FirebaseAuth _auth=FirebaseAuth.instance;
  singUp(String email,String password) async {
     _result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if(_result!.user!=null){
    debugPrint(" result ${_result!.user}");
    _user=_result!.user;
    }


    else{
      debugPrint("user null");
    }
  }
  singIn(String email,String password) async {

    try{
       DialogServices.dialogLoading();
      Future.delayed(Duration.zero);
    _result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    debugPrint("Response : $_result");

    if(_result!.user!=null){

      debugPrint(" result ${_result!.user}");
      _user=_result!.user;
    }


    else{
      debugPrint("user null");
    }
      DialogServices.dialogPop();
  }
  catch(e,st){
      debugPrint("SingIn Error : $e $st");
  }finally{
      notifyListeners();
    }
  }

  User? get user => _user;

}