import 'dart:convert';
import 'dart:io';

import 'package:employeeadmin/model/valueObject/Department.dart';
import 'package:employeeadmin/model/valueObject/User.dart';
import 'package:http/io_client.dart' as http;
import 'package:puremvc/puremvc.dart';

class UserProxy extends Proxy {

  static String NAME = "UserProxy";

  late final http.IOClient _client;

  UserProxy(): super(NAME, <User>[]) { // bypassing self-signed certificate
    _client = http.IOClient(HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true);
  }

  Future<List<User>> findAllUsers() async {
    final response = await _client.get(Uri.parse("https://10.0.2.2/employees")); // iOS localhost

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> findById(int id) async {
    final response = await _client.get(Uri.parse("https://10.0.2.2/employees/${id}"));

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      return User.fromJson(json);
    } else {
      throw Exception("Failed to load User");
    }
  }

  Future<List<Department>> findAllDepartments() async {
    final response = await _client.get(Uri.parse("https://10.0.2.2/departments"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Department.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load departments");
    }
  }

}
