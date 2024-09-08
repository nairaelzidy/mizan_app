import 'package:flutter/material.dart';
import 'package:mizan/Cache/cache_helper.dart';

import '../widgets/above_card.dart';

class AqsatScreen extends StatefulWidget {
  @override
  State<AqsatScreen> createState() => _AqsatScreenState();
}

class _AqsatScreenState extends State<AqsatScreen> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController qestController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String? qest;
  String? date;
  String? note;

  bool hasqest = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }


  void _loadSavedData() async {
    bool ww = CacheHelper.containKey(key: "qest");
    print("ssssssss");
    print(ww);
    String? savedQest = CacheHelper.getData(key: "qest");
    String? savedDate = CacheHelper.getData(key: "date");
    String? savedNote = CacheHelper.getData(key: "note");

    if (savedQest != null && savedDate != null && savedNote != null) {
      setState(() {
        qest = savedQest;
        date = savedDate;
        note = savedNote;
        hasqest = true;
        print("WWWWWWWWWWww");
        print(qest);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('ميزان', style: TextStyle(color: Colors.black)),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF0EAD6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AboveCard(text: "في هذه الغرفة يتم عرض او اضافه او حذف الاقساط الملتزم بها حاليا"),
            SizedBox(height: 20),


            hasqest
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'القسط الشهري: $qest',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'المعاد: $date',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ملاحظات: $note',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 20),


                    ],
                  ),
                ),
              ),
            )
                : Center(
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFf5d2b0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/no quest.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddInstallmentDialog(context);
        },
        backgroundColor: Color(0xFF708872),
        child: Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  void _showAddInstallmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'اضافة قسط جديد',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: qestController,
                  decoration: InputDecoration(
                    labelText: 'القسط الشهري',
                    alignLabelWithHint: true,
                  ),
                  onSaved: (input) => qest = input,
                  onChanged: (input) => qest = input,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'المعاد',
                    alignLabelWithHint: true,
                  ),
                  onSaved: (input) => date = input,
                  onChanged: (input) => date = input,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: noteController,
                  decoration: InputDecoration(
                    labelText: 'ملاحظات',
                    alignLabelWithHint: true,
                  ),
                  onSaved: (input) => note = input,
                  onChanged: (input) => note = input,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF708872),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        CacheHelper.saveData(key: "qest", value: qestController.text);
                        CacheHelper.saveData(key: "date", value: dateController.text);
                        CacheHelper.saveData(key: "note", value: noteController.text);

                        setState(() {
                          qest = qestController.text;
                          date = dateController.text;
                          note = noteController.text;
                          hasqest = true;
                        });

                        Navigator.pop(context);
                      },
                      child: Text('إضافة'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'الغاء',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}