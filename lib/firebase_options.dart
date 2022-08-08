// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGjzoN3CoThBpMMo_2mlCwDDg0mfr7jWg',
    appId: '1:574142341348:android:1d228fba1951edf1a3ccf1',
    messagingSenderId: '574142341348',
    projectId: 'loginproject-f498b',
    databaseURL: 'https://loginproject-f498b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'loginproject-f498b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNTm1ch9Orkpz9cyPS_KZ-Uf6Ynj5U_nk',
    appId: '1:574142341348:ios:3a05138916b91abca3ccf1',
    messagingSenderId: '574142341348',
    projectId: 'loginproject-f498b',
    databaseURL: 'https://loginproject-f498b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'loginproject-f498b.appspot.com',
    iosClientId: '574142341348-7sb1tim1ncf2h6rfpku1pblfvemgpr50.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginProjects',
  );
}
