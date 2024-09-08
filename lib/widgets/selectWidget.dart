import 'package:flutter/material.dart';

class Selectwidget extends StatefulWidget {
  const Selectwidget({super.key,required this.titel,required this.listItem});
 final String titel;
 final List <String> listItem;

  @override
  State<Selectwidget> createState() => _SelectwidgetState();
}

class _SelectwidgetState extends State<Selectwidget> {
  String? selecteditem;

  @override
  Widget build(BuildContext context) {
    return
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.titel,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
         DropdownButton<String>(
            value: selecteditem,
            items: widget.listItem.map((String city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selecteditem = newValue!;
              });
            },),
      ],
    );
 
  }
}
