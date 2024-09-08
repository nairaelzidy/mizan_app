import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({ this.onTap ,required this.text}) ;
  VoidCallback? onTap;
  String text;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 69, 87, 70),
            borderRadius: BorderRadius.circular(50),
          ),
          width: 40,
          height: 30,
          child: Center(
            child: Text(text,style: TextStyle(fontSize: 20,
              color: Colors.black,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
