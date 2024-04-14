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
    apiKey: 'AIzaSyBFC53Xb-kngINX2ubX5-RfXOCXeB3TSTg',
    appId: '1:964230956095:web:955f42f3eaf847e02d248a',
    messagingSenderId: '964230956095',
    projectId: 'slackclonedatabase',
    authDomain: 'slackclonedatabase.firebaseapp.com',
    storageBucket: 'slackclonedatabase.appspot.com',
    measurementId: 'G-8QB445SYQT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-HHTGyQ2X2QLXzLGywUwlY5yqkPB4B8g',
    appId: '1:964230956095:android:2eafea8a1145e39a2d248a',
    messagingSenderId: '964230956095',
    projectId: 'slackclonedatabase',
    storageBucket: 'slackclonedatabase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0x5h4-Mz6-yRRlwfDuX8mlldXCkS_NSM',
    appId: '1:964230956095:ios:e20ca86c3f6a15002d248a',
    messagingSenderId: '964230956095',
    projectId: 'slackclonedatabase',
    storageBucket: 'slackclonedatabase.appspot.com',
    iosBundleId: 'com.example.slackclone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0x5h4-Mz6-yRRlwfDuX8mlldXCkS_NSM',
    appId: '1:964230956095:ios:cbfc65943095767f2d248a',
    messagingSenderId: '964230956095',
    projectId: 'slackclonedatabase',
    storageBucket: 'slackclonedatabase.appspot.com',
    iosBundleId: 'com.example.slackclone.RunnerTests',
  );
}
