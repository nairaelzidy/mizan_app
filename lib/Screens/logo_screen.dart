
import 'package:flutter/material.dart';
import 'package:mizan/Screens/register.dart';

import '../Cache/cache_helper.dart';

class Logo extends StatefulWidget {
  static String routeName = 'Logo';
  const Logo({super.key});
  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  bool islogin = CacheHelper.containKey(key: 'Password');
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      await Navigator.pushNamed( context,Register.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
            body: Center(
                child: CircleAvatar(
      radius: 210,
      backgroundImage: AssetImage('assets/images/login.gif'),
    ))));
  }
}
