import 'package:flutter/material.dart';

import '../constant/constant.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({super.key, this.imagePath, this.text, this.color, this.onTap});

  final String? imagePath;
  final String? text;
  final Color? color;
  final VoidCallback? onTap;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: ScreenSize.const_width,
        height: ScreenSize.const_height / 6,
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: widget.color,
          child: ListTile(
            leading: widget.imagePath != null
                ? CircleAvatar(
              backgroundImage: AssetImage(widget.imagePath!),
              radius: ScreenSize.const_height / 22,
            )
                : null,
            title: Center(
              child: Text(
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                widget.text.toString(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}