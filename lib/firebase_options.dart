// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA9zvt81jqkRd09L1DXbFfhLEklCeH-Sok',
    appId: '1:516752595429:web:e8a47efbeb7e7e2ba8b70c',
    messagingSenderId: '516752595429',
    projectId: 'todo-1-ac252',
    authDomain: 'todo-1-ac252.firebaseapp.com',
    storageBucket: 'todo-1-ac252.appspot.com',
    measurementId: 'G-YYYBRFXXS0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByiNm1Zxj0p0XFOPKfUgfhAEj9dSGGBPw',
    appId: '1:516752595429:android:7beaa4105735a3cba8b70c',
    messagingSenderId: '516752595429',
    projectId: 'todo-1-ac252',
    storageBucket: 'todo-1-ac252.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPsJcuKn75f7XkkpPakWTqZKtlqAGXdJY',
    appId: '1:516752595429:ios:e11d6cd69d1405fca8b70c',
    messagingSenderId: '516752595429',
    projectId: 'todo-1-ac252',
    storageBucket: 'todo-1-ac252.appspot.com',
    iosBundleId: 'com.example.todo1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPsJcuKn75f7XkkpPakWTqZKtlqAGXdJY',
    appId: '1:516752595429:ios:e11d6cd69d1405fca8b70c',
    messagingSenderId: '516752595429',
    projectId: 'todo-1-ac252',
    storageBucket: 'todo-1-ac252.appspot.com',
    iosBundleId: 'com.example.todo1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9zvt81jqkRd09L1DXbFfhLEklCeH-Sok',
    appId: '1:516752595429:web:aaa8e4bf797a5440a8b70c',
    messagingSenderId: '516752595429',
    projectId: 'todo-1-ac252',
    authDomain: 'todo-1-ac252.firebaseapp.com',
    storageBucket: 'todo-1-ac252.appspot.com',
    measurementId: 'G-VGRWS8WQ56',
  );
}
