import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension DateFormatter on String {
  String formatDate() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String output = dateFormat.format(dateTime);
    return output;
  }

  String formatTime() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("HH:mm");
    String output = dateFormat.format(dateTime);
    return output;
  }

  String formatDateAndTime() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("HH:mm dd.MM.yyyy");
    String output = dateFormat.format(dateTime);
    return output;
  }
}
