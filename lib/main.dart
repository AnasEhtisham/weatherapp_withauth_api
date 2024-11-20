import 'package:weather_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDW2f1DUb0M6TWrNul0vn4AcrAq1g4v3ps",
        authDomain: "first-setup-4a6ee.firebaseapp.com",
        projectId: "first-setup-4a6ee",
        storageBucket: "first-setup-4a6ee.firebasestorage.app",
        messagingSenderId: "165354385312",
        appId: "1:165354385312:web:de20b0501f0c5580383ec5",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
