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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuXxbVioP5bMEVUPZI8m-rhpknr37GpMY',
    appId: '1:506259824995:android:f7727b09079658e40bb356',
    messagingSenderId: '506259824995',
    projectId: 'espe-tesisv2',
    storageBucket: 'espe-tesisv2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuXxbVioP5bMEVUPZI8m-rhpknr37GpMY',
    appId: '1:506259824995:ios:01a9df897fc729110bb356',
    messagingSenderId: '506259824995',
    projectId: 'espe-tesisv2',
    storageBucket: 'espe-tesisv2.appspot.com',
    iosBundleId: 'com.example.tesisV1',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALEw75joESdSH0QKItUK51DSvSQ-kyh68',
    appId: '1:506259824995:web:ee967ad752bc9fbf0bb356',
    messagingSenderId: '506259824995',
    projectId: 'espe-tesisv2',
    authDomain: 'espe-tesisv2.firebaseapp.com',
    storageBucket: 'espe-tesisv2.appspot.com',
    measurementId: 'G-F7CWPEBBVE',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAU5_wOa0RFVRu7SrE0d9JlIcptnUIwugg',
    appId: '1:506259824995:ios:01a9df897fc729110bb356',
    messagingSenderId: '506259824995',
    projectId: 'espe-tesisv2',
    storageBucket: 'espe-tesisv2.appspot.com',
    iosBundleId: 'com.example.tesisV1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALEw75joESdSH0QKItUK51DSvSQ-kyh68',
    appId: '1:506259824995:web:31e9d68b9efd69f00bb356',
    messagingSenderId: '506259824995',
    projectId: 'espe-tesisv2',
    authDomain: 'espe-tesisv2.firebaseapp.com',
    storageBucket: 'espe-tesisv2.appspot.com',
    measurementId: 'G-VLTND5PHTV',
  );

}