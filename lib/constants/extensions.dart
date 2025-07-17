import 'package:flutter/material.dart';

extension NumExtension on num {
  /// Gap Widget
  SizedBox get gap => SizedBox(height: toDouble(), width: toDouble());

  /// EdgeInsets
  EdgeInsets get edgeInsetsAll => EdgeInsets.all(toDouble());

  /// BorderRadius
  BorderRadius get borderRadiusAll => BorderRadius.circular(toDouble());
}
