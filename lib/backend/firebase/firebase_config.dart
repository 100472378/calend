import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDV83dW6ogpwIjg3zbJWW-iPVAzuWSFoKE",
            authDomain: "calend-8snn4n.firebaseapp.com",
            projectId: "calend-8snn4n",
            storageBucket: "calend-8snn4n.firebasestorage.app",
            messagingSenderId: "319505700000",
            appId: "1:319505700000:web:3692340b82f7adc13be5c5"));
  } else {
    await Firebase.initializeApp();
  }
}
