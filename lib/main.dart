import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/application/application.dart';
import 'package:flutter_mvvm_architecture/configs/application/injector.dart';

void main() {
  runApp(const Injector(child: Applicatoin()));
}
