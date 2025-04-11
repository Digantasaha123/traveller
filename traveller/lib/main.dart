import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/main_container.dart';
import 'pages/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = false;

  try {
    // Check if user is already logged in
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    final password = prefs.getString('password') ?? '';

    isLoggedIn = username.isNotEmpty && password.isNotEmpty;
  } catch (e) {
    // Log the error or handle it appropriately
    debugPrint('Error initializing SharedPreferences: $e');
  }

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: isLoggedIn ? const MainContainer() : const SignIn(),
    );
  }
}
