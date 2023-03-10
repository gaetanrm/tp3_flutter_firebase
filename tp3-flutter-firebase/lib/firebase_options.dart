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
        return macos;
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
    apiKey: 'AIzaSyBpqX-iRIe2eceUkSsbvcDINqXQ1E1wFhY',
    appId: '1:88170311183:web:a2fe95900c4246d6cbfd7a',
    messagingSenderId: '88170311183',
    projectId: 'tp3-flutter-firebase-96107',
    authDomain: 'tp3-flutter-firebase-96107.firebaseapp.com',
    storageBucket: 'tp3-flutter-firebase-96107.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAH2RIB4jz4yqXWU8TkCl9UVEkopq3Fc9Q',
    appId: '1:88170311183:android:16d876ae45e13875cbfd7a',
    messagingSenderId: '88170311183',
    projectId: 'tp3-flutter-firebase-96107',
    storageBucket: 'tp3-flutter-firebase-96107.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAASJlkcja7uOaUdf5ZgUVwFuQY1JA3Z-o',
    appId: '1:88170311183:ios:adc3c2e6d2e4c3a1cbfd7a',
    messagingSenderId: '88170311183',
    projectId: 'tp3-flutter-firebase-96107',
    storageBucket: 'tp3-flutter-firebase-96107.appspot.com',
    iosClientId: '88170311183-95maa93tdib980jnatdgnh7sdp12se0g.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3FlutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAASJlkcja7uOaUdf5ZgUVwFuQY1JA3Z-o',
    appId: '1:88170311183:ios:adc3c2e6d2e4c3a1cbfd7a',
    messagingSenderId: '88170311183',
    projectId: 'tp3-flutter-firebase-96107',
    storageBucket: 'tp3-flutter-firebase-96107.appspot.com',
    iosClientId: '88170311183-95maa93tdib980jnatdgnh7sdp12se0g.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3FlutterFirebase',
  );
}
