import 'package:puremvc/puremvc.dart';

import '../model/RoleProxy.dart';
import '../model/UserProxy.dart';

class StartupCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {
    facade.registerProxy(UserProxy());
    facade.registerProxy(RoleProxy());
  }

}