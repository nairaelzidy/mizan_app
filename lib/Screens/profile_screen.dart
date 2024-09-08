import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constant/constant.dart';
import '../widgets/custombutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static String id = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الميران",
          style: TextStyle(
              fontFamily: "Gulzar", fontSize: 20, color: Colors.black),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 40,
              child: Container(
                  decoration: const BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  width: ScreenSize.const_width / 1.2,
                  height: ScreenSize.const_height / 1.5,
                  child: Column(
                    children: [
                      SizedBox(height: ScreenSize.const_height / 8),
                      const Text(
                        "نيره",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Gulzar",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        "hddddddwa",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Gulzar",
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      CustomButon(
                        text: '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 50.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 10.0,
                                percent: 0.4,
                                center: const Text(
                                  "63",
                                  // "${widget.percentage.toStringAsFixed(1)}%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.grey,
                                progressColor: const Color(0xFF708872),
                              ),
                              Text(" الحساب البنكي")
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 50.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 10.0,
                                percent: 0.4,
                                center: const Text(
                                  "63",
                                  // "${widget.percentage.toStringAsFixed(1)}%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.grey,
                                progressColor: const Color(0xFF708872),
                              ),
                              Text("الراتب الشهري")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButon(text: "تعديل")
                    ],
                  )),
            ),
            Positioned(
              top: ScreenSize.const_height / 17,
              child: CircleAvatar(
                radius: ScreenSize.const_width / 7.2,
                backgroundColor: kprimaryColor,
                child: CircleAvatar(
                  radius: ScreenSize.const_width / 8,
                  backgroundImage: const AssetImage(
                    "assets/assets_competition/images/slogan.gif",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
