import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/application/application.dart';
import 'package:flutter_mvvm_architecture/configs/application/injector.dart';
import 'package:flutter_mvvm_architecture/configs/locator.dart';

void main() {
  setup();
  runApp(const Injector(child: Application()));
}
