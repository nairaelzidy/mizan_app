
import 'package:flutter/material.dart';

import '../Cache/cache_helper.dart';
import '../constant/constant.dart';

import '../widgets/selectWidget.dart';
import 'conver_currencies.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static String routeName = 'Register';

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController balance = TextEditingController();
  bool obSecureSalary = true;
  bool obSecurebalance = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 130,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/masrouf.png'),
                          fit: BoxFit.fill))),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: formkey,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                              labelText: 'الاسم بالكامل',
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل الاسم بالكامل';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                              labelText: 'البريد الالكترونى',
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'ادحل الايميل';
                              } else if (!value.contains('@gmail.com')) {
                                return 'ادخل ايميل صحيح';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: salary,
                            obscureText: obSecureSalary,
                            decoration: InputDecoration(
                                labelText: 'الراتب الشهرى',
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obSecureSalary = !obSecureSalary;
                                      });
                                    },
                                    icon: obSecureSalary
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 30,
                                          )
                                        : const Icon(Icons.visibility,
                                            size: 30))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل الراتب الشهرى';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: balance,
                            obscureText: obSecurebalance,
                            decoration: InputDecoration(
                                labelText: ' الرصيد البنكى',
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obSecurebalance = !obSecurebalance;
                                      });
                                    },
                                    icon: obSecurebalance
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 30,
                                          )
                                        : const Icon(Icons.visibility,
                                            size: 30))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ادخل الرصيد البنكى';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Selectwidget(
                          titel: 'اختر الدوله:',
                          listItem: items1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(200, 50),
                            ),
                            onPressed: () {
                              CacheHelper.saveData(
                                  key: 'الاسم بالكامل', value: name.text);
                              CacheHelper.saveData(
                                  key: 'الايميل الالكترونى', value: email.text);
                              CacheHelper.saveData(
                                  key: 'الراتب الشهرى', value: salary);
                              CacheHelper.saveData(
                                  key: ' الرصيد', value: balance);
                              if (formkey.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, ConverCurrencies.routeName);
                              }
                            },
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ])),
            ],
          )),
        ),
      ),
    );
  }
}
