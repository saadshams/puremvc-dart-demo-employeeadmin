import 'package:employeeadmin/ApplicationConstants.dart';
import 'package:employeeadmin/view/UserFormMediator.dart';
import 'package:employeeadmin/view/UserListMediator.dart';
import 'package:employeeadmin/view/UserRoleMediator.dart';
import 'package:puremvc/puremvc.dart';


class RegisterCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {

    switch(notification.type) {
      case ApplicationConstants.USER_LIST_MOUNTED:
        facade.registerMediator(UserListMediator(notification.body));
        break;
      case ApplicationConstants.USER_LIST_UNMOUNTED:
        facade.removeMediator(UserListMediator.NAME);
        break;
      case ApplicationConstants.USER_FORM_MOUNTED:
        facade.registerMediator(UserFormMediator(notification.body));
        break;
      case ApplicationConstants.USER_FORM_UNMOUNTED:
        facade.removeMediator(UserFormMediator.NAME);
        break;
      case ApplicationConstants.USER_ROLE_MOUNTED:
        facade.registerMediator(UserRoleMediator(notification.body));
        break;
      case ApplicationConstants.USER_ROLE_UNMOUNTED:
        facade.removeMediator(UserRoleMediator.NAME);
        break;
    }
  }

}