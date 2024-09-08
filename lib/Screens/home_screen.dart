import 'package:flutter/material.dart';
import 'package:mizan/Screens/aqsat_screen.dart';
import 'package:mizan/Screens/masrouf_screen.dart';
import 'package:mizan/Screens/profile_screen.dart';
import 'package:mizan/widgets/above_card.dart';
import 'package:mizan/widgets/option_card.dart';

import '../constant/constant.dart';
import 'conver_currencies.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('ميزان'),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: Color(0xFFF0EAD6),
      body: SafeArea(
        child: Column(
          children: [
            AboveCard(text: "أهلا بك في الميزان يا جاكلين سعد"),
            SizedBox(height: 20),
            // List of Options
            Expanded(
              child: ListView(
                children: [
                  OptionCard(
                    imagePath: "assets/images/dolar.png",
                    text: 'حساب تحويل العملات الى الدولار',
                    color: Color(0xFF708872),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConverCurrencies(),
                        ),
                      );
                    },
                  ),
                  OptionCard(
                    imagePath: "assets/images/aqsat.jpg",
                    text: 'عرض الأقساط و مواعيدها',
                    color: Color(0xFF708872),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AqsatScreen(),
                        ),
                      );
                    },
                  ),
                  OptionCard(
                    imagePath: "assets/images/masrouf.png",
                    text: 'تنظيم المصروفات بالنسبة لدخلك الشهري',
                    color: Color(0xFF708872),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MasroufScreen(),
                        ),
                      );
                    },
                  ),
                  OptionCard(
                    imagePath: "assets/images/data.jpg",
                    text: 'البيانات الشخصية',
                    color: Color(0xFF708872),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
