import 'dart:collection';
import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/model/enum/role_enum.dart';

class RoleProxy extends Proxy {

  static const NAME = 'RoleProxy';

  RoleProxy() : super(NAME, <String, List<RoleEnum>>{});

  void saveRole(String username, RoleEnum role) {
    data.putIfAbsent(username, []);
    data[username]!.add(roles);
  }

  void updateRoles(String username, List<RoleEnum> roles) {
    data[username] = roles;
  }

  List<RoleEnum> findRoles(String username) {
    return data[username] ?? [];
  }

  void removeRole(String username, RoleEnum role) {
    if (data.containsKey(username)) {
      data[username]!.remove(role);
      if (data[username]!.isEmpty) {
        data.remove(username);
      }
    }
  }

  Map<String, List<RoleEnum>> get roles => UnmodifiableMapView(data);
}