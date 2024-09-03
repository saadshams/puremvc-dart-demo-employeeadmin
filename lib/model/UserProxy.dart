import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:employeeadmin/model/valueObject/Department.dart';
import 'package:employeeadmin/model/valueObject/User.dart';
import 'package:puremvc/puremvc.dart';

class UserProxy extends Proxy {

  static String NAME = "UserProxy";

  UserProxy(): super(NAME, null) {}

  Future<List<User>> findAllUsers() async {
    final response = await http.get(Uri.parse("https://10.0.2.2/users"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> findById(int id) async {
    final response = await http.get(Uri.parse("https://10.0.2.2/users/${id}"));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception("Failed to load User");
    }
  }

  Future<List<Department>> findAllDepartments() async {
    final response = await http.get(Uri.parse("https://10.0.2.2/departments"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Department.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load departments");
    }
  }

}
