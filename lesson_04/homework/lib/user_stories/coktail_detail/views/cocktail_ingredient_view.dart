import 'package:flutter/material.dart';

class CocktailIngredientItem {
  final String name;
  final String measure;

  const CocktailIngredientItem({this.name, this.measure});
}

class CocktailIngredientView extends StatelessWidget {
  final List<CocktailIngredientItem> items;

  const CocktailIngredientView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _titleView(title: "Ингредиенты:"),
        Column(children: items.map((item) => _itemView(item: item)).toList())
      ]));
  }

  Widget _titleView({String title}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 24),
      child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color(0xffb1afc6)))
    );
  }

  Widget _itemView({ CocktailIngredientItem item }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(item.name, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, decoration: TextDecoration.underline, color: Colors.white)),
          Spacer(),
          Text(item.measure, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white))
        ]),
    );
  }
}