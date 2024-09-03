import "package:employeeadmin/controller/RegisterCommand.dart";
import "package:puremvc/puremvc.dart";

import "controller/StartupCommand.dart";

class ApplicationFacade extends Facade {

  static const String NAME = "EmployeeAdmin";

  static const String STARTUP = "startup";

  static const String REGISTER = "register";

  ApplicationFacade(super.key);

  @override
  void initializeController() {
    super.initializeController();
    registerCommand(STARTUP, () => StartupCommand());
    registerCommand(REGISTER, () => RegisterCommand());
  }

  static ApplicationFacade getInstance(String key) {
    return Facade.getInstance(key, (k) => ApplicationFacade(k)) as ApplicationFacade;
  }

  void startup() {
    sendNotification(STARTUP);
  }

}