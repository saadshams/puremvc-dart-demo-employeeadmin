import 'package:flutter/material.dart';
import 'package:employee_admin/application.dart';
import 'package:employee_admin/application_facade.dart';

void main() {
  ApplicationFacade.getInstance(ApplicationFacade.KEY).startup();
  runApp(const Application());
}
