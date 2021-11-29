import 'package:flutter/material.dart';

class CocktailHeaderView extends StatelessWidget {
  final String link;
  const CocktailHeaderView({Key key, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _imageView(link: link);
  }

  Widget _imageView({String link}) {
    return Container(
          width: double.infinity,
          height: 343, 
          color: Colors.black,
          child: Image.network(link, fit: BoxFit.fitWidth),
    );
  }
}