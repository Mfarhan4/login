import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Client {
  String name;
  String cName;
  Client({required this.name,required this.cName});
  factory Client.fromJson(Map<String,dynamic> map){
    return Client(name: map["name"],cName: map["company_name"] );
  }
}