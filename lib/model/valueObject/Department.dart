class Department {

  static Department NONE_SELECTED = Department(id: 0, name: "---None Selected---");

  int id;
  String name;

  Department({required this.id, required this.name});

  factory Department.fromJson(Map<String, dynamic>? json) {
    return json == null ? Department.NONE_SELECTED : Department(id: json["id"], name: json["name"]);
  }

  @override
  String toString() {
    return name;
  }

}