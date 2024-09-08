import 'package:flutter/material.dart';


class AboveCard extends StatefulWidget {
  const AboveCard({required this.text});
  final String? text;


  @override
  State<AboveCard> createState() => _AboveCardState();
}

class _AboveCardState extends State<AboveCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo (2).png'),
          ),
          const SizedBox(width: 10),
          
          // Text bubble
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top :25.0),
              child: Container(
                padding:const EdgeInsets.all(16),
                decoration:const BoxDecoration(
                  color: Color(0xFFbec69f),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),                ),
                child: Text(
                 widget.text.toString(),
                  style:const TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Text color
                  ),
                  textAlign: TextAlign.right, // Text aligned to the right
                ),
              ),
            ),
          ),
          
          // Icon bubble

          
        ],
      ),
    );
  }
}