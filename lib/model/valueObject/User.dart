import "Department.dart";

class User {
  int id;
  String username;
  String first;
  String last;
  String email;
  String password;
  Department department;

  User({this.id = 0, this.username = "", this.first = "", this.last = "",
    this.email = "", this.password = "", Department? department }) : department = department ?? Department.NONE_SELECTED;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["id"], username: json["username"] ?? "", first: json["first"], last: json["last"],
        email: json["email"] ?? "", password: json["password"] ?? "", department: Department.fromJson(json["department"]));
  }

  @override
  String toString() {
    return "$last, $first";
  }

}