import 'package:employee_admin/model/enum/role_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/model/user_proxy.dart';
import 'package:employee_admin/model/role_proxy.dart';
import 'package:employee_admin/model/valueObject/user.dart';

class EmployeeAdminMediator extends Mediator with ChangeNotifier {

  static const String NAME = 'EmployeeAdminMediator';

  List<User> users = [];
  User? user;
  List<RoleEnum> roles = [];

  UserProxy? userProxy;
  RoleProxy? roleProxy;

  EmployeeAdminMediator([String? mediatorName, dynamic viewComponent]): super(mediatorName ?? NAME, viewComponent);

  @override
  void onRegister() {
    userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy?;
    roleProxy = facade.retrieveProxy(RoleProxy.NAME) as RoleProxy?;
  }

  void findAllUsers() {
    users = userProxy?.users ?? [];
    notifyListeners();
  }

  void findByUsername(String username) {
    user = userProxy?.findByUsername(username);
    notifyListeners();
  }

  void save(User user) {
    userProxy?.save(user);
    notifyListeners();
  }

  void update(User user) {
    userProxy?.update(user);
    notifyListeners();
  }

  void delete(User? user) {
    if (user == null) return;
    userProxy?.delete(user);
    notifyListeners();
  }

  void findRolesByUsername(String username) {
    roles = roleProxy?.findRoles(username) ?? [];
    notifyListeners();
  }

  void updateRolesByUsername(String username, List<RoleEnum> roles) {
    roleProxy?.updateRoles(username, roles);
  }

}
