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
    apiKey: 'AIzaSyC-vaGVtox0xymc08Ul4-YZ1ia3_h4qIb4',
    appId: '1:1016786669711:web:2519508a6c681c3a3420fa',
    messagingSenderId: '1016786669711',
    projectId: 'addall-36b4e',
    authDomain: 'addall-36b4e.firebaseapp.com',
    storageBucket: 'addall-36b4e.appspot.com',
    measurementId: 'G-F67FY4HG4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCUSCBFOs3GJwxE_HiDrSo3M_auKhxJkU',
    appId: '1:1016786669711:android:9864b47669b536663420fa',
    messagingSenderId: '1016786669711',
    projectId: 'addall-36b4e',
    storageBucket: 'addall-36b4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfNctJUEMdcApBrYSlsHdBPz4qvQf7P7A',
    appId: '1:1016786669711:ios:fc0203c3bf15e9973420fa',
    messagingSenderId: '1016786669711',
    projectId: 'addall-36b4e',
    storageBucket: 'addall-36b4e.appspot.com',
    iosClientId: '1016786669711-rfga6k8qcldgfjl71tfv0icnr24cql00.apps.googleusercontent.com',
    iosBundleId: 'com.example.addAll',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfNctJUEMdcApBrYSlsHdBPz4qvQf7P7A',
    appId: '1:1016786669711:ios:e74f538e235c23123420fa',
    messagingSenderId: '1016786669711',
    projectId: 'addall-36b4e',
    storageBucket: 'addall-36b4e.appspot.com',
    iosClientId: '1016786669711-aibcgcuqil2d38vg1ldq24607qshft2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.addAll.RunnerTests',
  );
}
