import 'package:employeeadmin/model/valueObject/Role.dart';
import 'package:puremvc/puremvc.dart';

class RoleProxy extends Proxy {

  static const NAME = "RoleProxy";

  RoleProxy() : super(NAME, <Role>[]);

  void addItem(Role role) {
    roles.add(role);
  }

  List<Role> get roles => data;

}