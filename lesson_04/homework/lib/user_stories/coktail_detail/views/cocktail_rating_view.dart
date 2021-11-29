import 'package:homework/components/components.dart';
import 'package:flutter/material.dart';

class CocktailRatingView extends StatelessWidget {
  final int rating;
  final Function(int) onPressed;

  const CocktailRatingView({Key key, int rating, this.onPressed}) : 
  this.rating = rating ?? 0,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1a1927),
      alignment: Alignment.topCenter,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 36),
      child: RatingView(rating: rating, maxRating: 5, onPressed: onPressed),
    );
  }
}