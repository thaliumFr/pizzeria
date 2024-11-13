import 'package:flutter/material.dart';

class PizzeriaStyle {
  static final baseTextStyle = TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle =
      baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle headerTextStyle = baseTextStyle.copyWith(fontSize: 20);

  static final TextStyle regularTextStyle =
      baseTextStyle.copyWith(fontSize: 16);

  static final TextStyle subHeaderTextStyle =
      baseTextStyle.copyWith(fontSize: 26);

  static final TextStyle itemPriceTextStyle =
      const TextStyle(color: Colors.blueGrey);

  static final TextStyle subPriceTextStyle =
      subPriceTextStyle.copyWith(fontSize: 20, color: Colors.indigo);

  static final TextStyle subPriceTotalTextStyle =
      itemPriceTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle priceTotalTextStyle =
      baseTextStyle.copyWith(fontSize: 22);

  static final TextStyle errorTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22.0,
  );
}
