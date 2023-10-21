import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ct/dropDown.dart';
import 'package:firebase_ct/features/screens/home_screen.dart';
import 'package:firebase_ct/utils/theme/widget_themes/theme.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,

      //home: LoginScreen(),
      //home: MainScreen(),
      //home: HomeScreen(),
      home: HomeScreen(),
    );
  }
}

