import 'package:flutter/material.dart';

import '../widgets/above_card.dart';
import '../widgets/expense_card.dart';

class MasroufScreen extends StatefulWidget {
  @override
  State<MasroufScreen> createState() => _MasroufScreenState();
}

class _MasroufScreenState extends State<MasroufScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('ميزان'),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF0EAD6),
      body: SafeArea(
        child: Column(
          children: [
            // Greeting card at the top
            AboveCard(text: "في هذه الصفحة يتم عرض أفضل نسبة لتنظيم مصروفاتك من خلال مرتبك"),
            SizedBox(height: 20),

            // Number in the center
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 100,
                height: 80,
                child: Center(
                  child: Text(
                    '63',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Horizontal scrollable list of Expense Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal, // Scroll direction set to horizontal
                  children: [
                    ExpenseCard(
                      title: 'الادخارات والاستثمارات',
                      percentage: 20.0,
                      subAmount: 12.3,
                      items: [
                        'زيادة المدخرات',
                        'تعجيل سداد الديون',
                        'حالات الطوارئ',
                      ],
                    ),
                    SizedBox(width: 10),

                    ExpenseCard(
                      title: 'مصروفاتك الشخصية المتغيرة',
                      percentage: 30.0,
                      subAmount: 18.9,
                      items: [
                        'التسوق',
                        'الأنشطة الترفيهية',
                        'الرحلات',
                        'الهدايا',
                      ],
                    ),
                    SizedBox(width: 10),
                    ExpenseCard(
                      title: 'مصروفاتك الأساسية الثابتة',
                      percentage: 50.0,
                      subAmount: 31.5,
                      items: [
                        'فواتير الكهرباء والمياه',
                        'مصاريف التعليم',
                        'الرعاية الصحية',
                        'النقل',
                        'الاتصالات',
                      ],
                    ),
                    SizedBox(width: 10),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}