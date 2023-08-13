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
    apiKey: 'AIzaSyC-gtmp9ueWGS1d5NuT76VGEdZ0ARcnKVI',
    appId: '1:711995609799:web:40457ff2b33084e04764e2',
    messagingSenderId: '711995609799',
    projectId: 'sharestud',
    authDomain: 'sharestud.firebaseapp.com',
    storageBucket: 'sharestud.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTQN9mJ5A88yD5NWzwe_PnskLfdWPwkhs',
    appId: '1:711995609799:android:c1d044f3717f4de64764e2',
    messagingSenderId: '711995609799',
    projectId: 'sharestud',
    storageBucket: 'sharestud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkR52kw6jZmq3ryNLbak6uqvEAUC9IHfA',
    appId: '1:711995609799:ios:8a3208cdbbcfa1154764e2',
    messagingSenderId: '711995609799',
    projectId: 'sharestud',
    storageBucket: 'sharestud.appspot.com',
    iosClientId:
        '711995609799-va4qprg98hbnahg6lsp8a0kb3m7cmaal.apps.googleusercontent.com',
    iosBundleId: 'com.example.shareStudyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkR52kw6jZmq3ryNLbak6uqvEAUC9IHfA',
    appId: '1:711995609799:ios:8a3208cdbbcfa1154764e2',
    messagingSenderId: '711995609799',
    projectId: 'sharestud',
    storageBucket: 'sharestud.appspot.com',
    iosClientId:
        '711995609799-va4qprg98hbnahg6lsp8a0kb3m7cmaal.apps.googleusercontent.com',
    iosBundleId: 'com.example.shareStudyApp',
  );
}
