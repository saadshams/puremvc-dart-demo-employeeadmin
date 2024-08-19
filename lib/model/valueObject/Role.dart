class Role {

  static Role NONE_SELECTED = Role(id: 0, name: "---None Selected---");

  int id;
  String name;

  Role({required this.id, required this.name});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(id: json["id"], name: json["name"]);
  }

}