import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            authDomain: "realduedojo.firebaseapp.com",
            projectId: "realduedojo",
            storageBucket: "realduedojo.appspot.com",
            messagingSenderId: "391279871687",
            appId: "1:391279871687:web:df597facaf50971f36e0e2"));
  } else {
    await Firebase.initializeApp();
  }
}
