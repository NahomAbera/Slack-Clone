import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart'; // Import your login page file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB-HHTGyQ2X2QLXzLGywUwlY5yqkPB4B8g", // paste your api key here
      appId: "1:964230956095:android:61e0082207dd61de2d248a", //paste your app id here
      messagingSenderId: "964230956095", //paste your messagingSenderId here
      projectId: "slackclonedatabase", //paste your project id here
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Set your app's primary color
      ),
      home: LoginPage(), // Start with the login page
    );
  }
}
