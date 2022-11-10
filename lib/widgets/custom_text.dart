// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final text,
      fontSize,
      fontWeight,
      color,
      overflow,
      textAlign,
      maxLines,
      letterSpacing,
      decoration,
      shadows,
      decorationColor;
  const CustomText(
      {this.text,
      this.letterSpacing,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.overflow,
      this.decoration,
      this.textAlign,
      this.maxLines,
      this.shadows,
      this.decorationColor,
      key})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return
        // text: widget.text,
        Text(
      widget.text,
      style: TextStyle(
          letterSpacing: widget.letterSpacing,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.color,
          decoration: widget.decoration,
          shadows: widget.shadows,
          decorationColor: widget.decorationColor),
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
    );
  }
}
