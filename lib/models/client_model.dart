import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  String? name;
  String id ;
  String email;
  String? photoUrl;
  User({ this.name,required this.id,required this.email,this.photoUrl});
  factory User.fromJson(Map<String,dynamic> map){
    return User(name: map["name"],id: map["uid"],email: map["email"],photoUrl: map["photoURL"] );
  }
}