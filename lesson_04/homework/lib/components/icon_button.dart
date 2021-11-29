import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatefulWidget {
  final bool isSelected;
  final IconData iconData;
  final String svgPictureName;

  final Color normalColor;
  final Color selectedColor;
  final Color normalBackgroundColor;
  final Color selectedBackgroundColor;

  final double width;
  final double height;
  final Radius borderRadius;

  final VoidCallback onPressed;

  const CustomIconButton({
    Key key, 
    bool isSelected,
    Color normalColor,
    this.width,
    this.height,
    this.borderRadius,
    this.iconData,
    this.svgPictureName,
    this.selectedColor, 
    this.normalBackgroundColor,
    this.selectedBackgroundColor,
    this.onPressed 
  }) :
    this.normalColor = normalColor ?? Colors.black,
    this.isSelected = isSelected ?? false,
    super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return _CustomIconButtonState();
  }
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isTaped = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = (widget.isSelected ? widget.normalBackgroundColor : widget.selectedBackgroundColor) ?? widget.normalBackgroundColor;

    return GestureDetector(
      child: Opacity(
        opacity: _isTaped ? 0.6 : 1.0, 
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: widget.borderRadius != null ? BorderRadius.all(widget.borderRadius) : null),
          child: _iconWidget())),
            onTapDown: (details) { _setTaped(true); },
            onTapUp: (details) { _setTaped(false); },
            onTapCancel: () { _setTaped(false); },
            onTap: widget.onPressed
    );
  }

  _setTaped(bool tapped) {
    setState(() { _isTaped = tapped; });
  }

  Widget _iconWidget() {
    final color = (widget.isSelected ? widget.selectedColor : widget.normalColor) ?? widget.normalColor;

    if (widget.svgPictureName != null) {
      return SvgPicture.asset(widget.svgPictureName, color: color);
    } else {
      return Icon(widget.iconData, color: color);
    }
  }
}