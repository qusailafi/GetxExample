import 'package:flutter/material.dart';

Container cardWidget(
    RoundedRectangleBorder? cardShape, Widget widget, EdgeInsets? cardPadding) {
  if (cardShape == null) {
    cardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  }
  if (cardPadding == null) {
    cardPadding = EdgeInsets.all(10);
  }
  return Container(
    child: Card(
      child: widget,
      shape: cardShape,
    ),
    padding: cardPadding,
  );
}
