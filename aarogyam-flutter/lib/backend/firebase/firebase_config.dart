import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDS6q1B099eLZDq2gPAWx96FeUCq1Lf4Vg",
            authDomain: "exam-baba-ux7hq8.firebaseapp.com",
            projectId: "exam-baba-ux7hq8",
            storageBucket: "exam-baba-ux7hq8.appspot.com",
            messagingSenderId: "525398884433",
            appId: "1:525398884433:web:d132b64d460883f3fa7870",
            measurementId: "G-KZS8J00QRP"));
  } else {
    await Firebase.initializeApp();
  }
}
