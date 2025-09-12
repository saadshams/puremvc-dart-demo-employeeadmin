import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/view/employee_admin_mediator.dart';

class PrepViewCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {
    facade.registerMediator(EmployeeAdminMediator());
  }
}