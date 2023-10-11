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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvIz9DxwBuMQtMYNIJCsjYr3130I3BwmM',
    appId: '1:309020367946:web:c54d1c980de0f7cd841ab3',
    messagingSenderId: '309020367946',
    projectId: 'myproject01-cb3da',
    authDomain: 'myproject01-cb3da.firebaseapp.com',
    storageBucket: 'myproject01-cb3da.appspot.com',
    measurementId: 'G-S33CHXGM85',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf0bFF__YW1sN_x7l4-430Ui-y4wPckQw',
    appId: '1:309020367946:android:208335cce2952db5841ab3',
    messagingSenderId: '309020367946',
    projectId: 'myproject01-cb3da',
    storageBucket: 'myproject01-cb3da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3bWsgBscd9dPfOcS9GiwjdXbfGAptNus',
    appId: '1:309020367946:ios:e959090658147d64841ab3',
    messagingSenderId: '309020367946',
    projectId: 'myproject01-cb3da',
    storageBucket: 'myproject01-cb3da.appspot.com',
    iosBundleId: 'com.example.myproject01',
  );
}
