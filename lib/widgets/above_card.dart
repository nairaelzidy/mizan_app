import 'package:flutter/material.dart';

import '../constant/constant.dart';

class AboveCard extends StatefulWidget {
  const AboveCard( {super.key, this.text});
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
          // Text bubble
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top :25.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFbec69f),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),                ),
                child: Text(
                 widget.text.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Text color
                  ),
                  textAlign: TextAlign.right, // Text aligned to the right
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          // Icon bubble

          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage('assets/images/logo (2).png'),
          )
        ],
      ),
    );
  }
}