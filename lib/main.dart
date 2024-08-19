import 'package:employeeadmin/Application.dart';
import 'package:employeeadmin/ApplicationFacade.dart';
import 'package:flutter/material.dart';

void main() {
  ApplicationFacade.getInstance("EmployeeAdmin").startup();
  runApp(const Application());
}
