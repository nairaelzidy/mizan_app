import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constant/constant.dart';

class ExpenseCard extends StatefulWidget {
  const ExpenseCard({super.key, required this.title, required this.percentage, required this.subAmount, required this.items,});

  final String title;
  final double percentage;
  final double subAmount;
  final List<String> items;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),


            // Container(
            //   height: 100,
            //   width: 100,
            //   child: Stack(
            //     children: [
            //       Center(
            //         child: SizedBox(
            //           height: 80,
            //           width: 80,
            //           child: CircularProgressIndicator(
            //             value: widget.percentage / 100,
            //             strokeWidth: 8,
            //             backgroundColor: Colors.grey[300],
            //             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF708872)),
            //           ),
            //         ),
            //       ),
            //       Center(
            //         child: Text(
            //           '${widget.percentage.toStringAsFixed(1)}%',
            //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            new CircularPercentIndicator(
              radius: 50.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.4,
              center: new Text(
                "${widget.percentage.toStringAsFixed(1)}%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor:Colors.grey,
              progressColor: Color(0xFF708872),
            ),

            // Sub amount
            SizedBox(height: 10),
            Text(
              widget.subAmount.toString(),
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            // List of items
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.map((item) => buildItemRow(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildItemRow(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(Icons.check, size: 16, color: Colors.black),
          SizedBox(width: 5),
          Text(
            item,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}