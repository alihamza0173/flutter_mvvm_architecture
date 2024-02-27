import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/application/application.dart';
import 'package:flutter_mvvm_architecture/utils/application/injector.dart';

void main() {
  runApp(const Injector(child: Applicatoin()));
}
