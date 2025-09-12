import 'package:employee_admin/model/enum/dept_enum.dart';

class User {
  String? username;
  String? first;
  String? last;
  String? email;
  String? password;
  DeptEnum? department;

  User({this.username, this.first, this.last, this.email, this.password, this.department = DeptEnum.noneSelected});

  @override
  String toString() {
    return '$last, $first';
  }

}