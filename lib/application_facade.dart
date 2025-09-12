import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/controller/startup_command.dart';

class ApplicationFacade extends Facade {

  static const String KEY = 'UserProxy';
  static const String START = 'start';

  ApplicationFacade(super.key);

  @override
  void initializeController() {
    super.initializeController();
    registerCommand(START, () => StartupCommand());
  }

  static ApplicationFacade getInstance(String key) {
    return Facade.getInstance(key, (k) => ApplicationFacade(k)) as ApplicationFacade;
  }

  void startup() {
    sendNotification(START);
  }

}