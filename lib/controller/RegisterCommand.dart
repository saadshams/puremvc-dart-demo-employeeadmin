import 'package:employeeadmin/view/UserFormMediator.dart';
import 'package:employeeadmin/view/UserListMediator.dart';
import 'package:employeeadmin/view/UserRoleMediator.dart';
import 'package:employeeadmin/view/components/UserForm.dart';
import 'package:employeeadmin/view/components/UserRole.dart';
import 'package:puremvc/puremvc.dart';

import '../view/components/UserList.dart';

class RegisterCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {
    if (notification.body is UserListState) {
      facade.removeMediator(UserListMediator.NAME);
      facade.registerMediator(UserListMediator(notification.body));
    } else if (notification.body is UserFormState) {
      facade.removeMediator(UserFormMediator.NAME);
      facade.registerMediator(UserFormMediator(notification.body));
    } else if (notification.body is UserRoleState) {
      facade.removeMediator(UserRoleMediator.NAME);
      facade.registerMediator(UserRoleMediator(notification.body));
    }
  }

}