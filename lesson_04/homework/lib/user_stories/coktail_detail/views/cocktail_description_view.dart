import 'package:flutter/material.dart';
import 'package:homework/components/components.dart';

class CocktailDescriptionView extends StatelessWidget {
  final String title;
  final String identifier;
  final String cocktailCategory;
  final String cocktailType;
  final String glassType;

  final bool liked;
  const CocktailDescriptionView({
    Key key, 
    this.title, 
    this.identifier, 
    this.cocktailCategory, 
    this.cocktailType, 
    this.glassType,
    this.liked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1a1927),
      width: double.infinity,
      padding: EdgeInsets.only(top: 33, left: 32, right: 32, bottom: 18),
      child:  Column(children: [
        _headerCell(title: title, icon: "assets/images/icon_hart.svg"),
        SizedBox(height: 20),
        _descriptionCell(title: "Категория коктейля", text: cocktailCategory),
        SizedBox(height: 18),
        _descriptionCell(title: "Тип коктейля", text: cocktailType),
        SizedBox(height: 18),
        _descriptionCell(title: "Тип стекла", text: glassType),
      ]));
  }

  Widget _headerCell({String title, String icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white))),
        Container(padding: EdgeInsets.only(top: 2.0), child: CustomIconButton(svgPictureName: icon, normalColor: Colors.white.withOpacity(0.8), selectedColor: Colors.white,  isSelected: liked, onPressed: () {}))
      ]),
      const SizedBox(height: 16),
      Text(identifier, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Color(0xff848396)))
    ]);
  }

  Widget _descriptionCell({String title, String text}) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xffeaeaea))),
        SizedBox(height: 8),
        Row(children: [TagView(text: text), Spacer()])
        //
    ]));
  }
}