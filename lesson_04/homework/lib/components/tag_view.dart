import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  final String text;
  const TagView({
    Key key, 
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff15151c),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)),
    );
  }
}