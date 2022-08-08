import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/client_provider.dart';
import '../provider/user_provider.dart';
import 'add_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    var  _ref=FirebaseDatabase.instance.ref().child("${userProvider.user!}").child("ClientData");
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
       // data();
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AddClientDataPage()));
      },child: const Icon(Icons.add),),
      appBar: AppBar(title: const Text("Home Page"),),
      body: FirebaseAnimatedList(query:_ref ,itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double> animation, int index){
        // var x=snapshot.value["name"];
        var value = Map<String, dynamic>.from(snapshot.value as Map);
        return ListTile(
            title: Text(value['name']),
          leading:  CircleAvatar(child: Icon(Icons.person)),
          subtitle: Text(value["company_name"]),
          trailing: IconButton(onPressed: (){
               var key= snapshot.key;
               if(key!=null){
               _ref.child(key).remove();}
            // FirebaseDatabase.instance.ref()
            //     .child(userProvider.user!).child('ClientData')
            //     .remove();

          },icon: Icon(Icons.clear)),
        );
      },),
    );
  }


}
