import 'icon_button.dart';
import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  final int rating;
  final int maxRating;
  final Function(int) onPressed;

  const RatingView({
    Key key, 
    int rating,
    int maxRating,
    this.onPressed 
  }) :
  this.rating = rating ?? 0,
  this.maxRating = maxRating ?? 5,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];

    for (var i = 0; i < maxRating; i++) {
      final selected = i < rating;
      items.add(_ratingView(selected: selected, index: i + 1));

      if (i < maxRating - 1) {
        items.add(SizedBox(width: 16));
      }
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: items);
  }

  Widget _ratingView({bool selected, int index}) {
    return CustomIconButton(
      isSelected: selected,
      svgPictureName: "assets/images/icon_star.svg",
      normalColor: Color(0xff1a1927),
      selectedColor: Colors.white,
      normalBackgroundColor: Color(0xff2a293a),
      width: 48, 
      height: 48, 
      borderRadius: Radius.circular(24), 
      onPressed: () { onPressed(index); }
    );
  }
}