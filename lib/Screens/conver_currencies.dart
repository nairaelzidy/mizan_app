
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widgets/above_card.dart';

class ConverCurrencies extends StatefulWidget {
  const ConverCurrencies({super.key});

  static String routeName = 'ConverCurrencies';

  @override
  State<ConverCurrencies> createState() => _ConverCurrenciesState();
}

class _ConverCurrenciesState extends State<ConverCurrencies> {
  String selecteditem = 'Egypt (EGP)';
  double money = 0.0;
  double result = 0.0;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ميزان',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AboveCard(


                  text:
                      'فى هذه الغرفه يمكنك تحويل العملات الى قيمتها الدولاريه'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('اختر العمله المراد تحويلها',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    dropdownColor: kprimaryColor,
                    value: selecteditem,
                    items: items.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selecteditem = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: 'ادخل المبلغ', border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      money = double.parse(value);
                    });
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kprimaryColor,
                    minimumSize: const Size(150, 50)),
                onPressed: () {
                  for (var key in moneyFelow.keys) {
                    if (key == selecteditem) {
                      setState(() {
                        result = money * moneyFelow[selecteditem]!;
                      });
                    }
                  }
                },
                child: const Text(
                  'تحويل',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 75,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Text(
                  '$selecteditem = $result USD',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
