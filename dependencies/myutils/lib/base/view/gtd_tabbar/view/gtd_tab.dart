import 'package:flutter/material.dart';

class MyTab<T> extends Tab {
  final T data;

  const MyTab({super.key, required this.data, super.text, super.child, super.icon, super.iconMargin});
}
