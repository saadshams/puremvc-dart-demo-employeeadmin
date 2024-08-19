import 'dart:async';

import 'package:employeeadmin/ApplicationConstants.dart';
import 'package:employeeadmin/model/UserProxy.dart';
import 'package:employeeadmin/view/components/UserForm.dart';
import 'package:puremvc/puremvc.dart';

import '../model/valueObject/User.dart';

class UserFormMediator extends Mediator {

  static const String NAME = "UserFormMediator";
  UserProxy? userProxy;

  UserFormMediator([dynamic viewComponent]): super(NAME, viewComponent);

  @override
  void onRegister() async {
    userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy?;

    userForm.stream = StreamController<Map<String, dynamic>>()
      ..stream.listen((data) async {
        switch (data["action"]) {
          case ApplicationConstants.USER_SELECTED:
            User user = await userProxy?.findById((data["detail"] as User).id) as User;
            userForm.setUser(user);
            break;
        }
      });

    userForm.setDepartments(await userProxy!.findAllDepartments());
  }

  UserFormState get userForm => viewComponent as UserFormState;

}
