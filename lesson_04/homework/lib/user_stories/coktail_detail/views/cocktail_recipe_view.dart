import 'package:flutter/material.dart';

class CocktailRecipeView extends StatelessWidget {
  final String text;
  const CocktailRecipeView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff201f2c),
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, left: 32, right: 36, bottom: 40),
      child: Column(children: [
        _headerView(title: "Иснтрукция для приготовления"),
        SizedBox(height: 24),
        _cellView(text: text)
      ]));
  }

  Widget _headerView({ String title }) {
    return Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 8),
          child: Text(title, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white))
    );
  }

  Widget _cellView({ String text }) {
    return Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 8),
          child: Text(text, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white))
    );
  }

}