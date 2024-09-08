
import 'package:flutter/material.dart';
import 'package:mizan/Screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     debugShowCheckedModeBanner: false,
     // locale: const Locale('ar'),
     // supportedLocales: const [
     //   Locale('ar' , ''),
     // ],
     //  localizationsDelegates: const [
     //    GlobalMaterialLocalizations.delegate, // Correct delegate
     //    GlobalWidgetsLocalizations.delegate,  // Required for widget localization
     //    GlobalCupertinoLocalizations.delegate, // For Cupertino widgets localization
     //  ],

     home:HomeScreen(),
    );
  }
}

