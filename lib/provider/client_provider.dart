import 'dart:convert';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:login_projects/Api/api.dart';
import 'package:login_projects/models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
     saveClient( String id,String name,String companyName)async {
       try{
         Uri uri=Uri.parse("${Api.baseUrl}${Api.addClient}");
         final DBRef = FirebaseDatabase.instance.ref().child("$id");



         var user={"name":name,
         "company_name":companyName
         };

        var  i=  DBRef.child("ClientData").push().set(user);

        debugPrint(" response ${i.toString()}");
       }
       catch(e ,st){

         debugPrint(" error $e $st");
       }
       finally{
         notifyListeners();
       }
     }

}