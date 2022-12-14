

import 'package:flutter/material.dart';
import 'package:login_projects/provider/client_provider.dart';
import 'package:login_projects/provider/user_provider.dart';
import 'package:login_projects/services/navigatorkey.dart';
import 'package:login_projects/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );
  FirebaseDatabase database = FirebaseDatabase.instance;
 // Firebase.initializeApp();
  runApp(
     MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ClientProvider()),
       ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
    ),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationServices.key,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  const LoginPage(),
    );
  }
}

