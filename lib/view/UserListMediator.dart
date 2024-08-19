import 'package:employeeadmin/view/components/UserList.dart';
import 'package:puremvc/puremvc.dart';

import '../model/RoleProxy.dart';
import '../model/UserProxy.dart';

class UserListMediator extends Mediator {

  static const String NAME = "UserListMediator";

  UserProxy? userProxy;
  RoleProxy? roleProxy;

  UserListMediator([dynamic viewComponent]): super(NAME, viewComponent);

  @override
  void onRegister() {
    userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy?;
    roleProxy = facade.retrieveProxy(RoleProxy.NAME) as RoleProxy?;
    userList.users = userProxy!.findAllUsers();
  }

  UserListState get userList => viewComponent as UserListState;

}