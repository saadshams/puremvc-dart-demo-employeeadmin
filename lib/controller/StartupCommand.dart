import 'package:puremvc/puremvc.dart';

import '../ApplicationConstants.dart';
import '../ApplicationFacade.dart';
import '../model/RoleProxy.dart';
import '../model/UserProxy.dart';
import '../view/EventBus.dart';

class StartupCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {
    facade.registerProxy(UserProxy());
    facade.registerProxy(RoleProxy());

    [ApplicationConstants.USER_LIST_MOUNTED, ApplicationConstants.USER_LIST_UNMOUNTED,
    ApplicationConstants.USER_FORM_MOUNTED, ApplicationConstants.USER_FORM_UNMOUNTED,
    ApplicationConstants.USER_LIST_MOUNTED, ApplicationConstants.USER_LIST_UNMOUNTED].forEach((key) {
      EventBus().subscribe(key, (dynamic sender) {
        sendNotification(ApplicationFacade.REGISTER, sender, key);
      });
    });

  }

}