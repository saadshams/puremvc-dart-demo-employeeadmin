import 'package:puremvc/puremvc.dart';

import 'package:employee_admin/model/user_proxy.dart';
import 'package:employee_admin/model/role_proxy.dart';
import 'package:employee_admin/model/enum/dept_enum.dart';
import 'package:employee_admin/model/enum/role_enum.dart';
import 'package:employee_admin/model/valueObject/user.dart';

class PrepModelCommand extends SimpleCommand {

  @override
  void execute(INotification notification) {

    var userProxy = UserProxy();
    userProxy.save(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));
    userProxy.save(User(username: 'cstooge', first: 'Curly', last: 'Stooge', email: 'curly@stooges.com', password: 'xyz987', department: DeptEnum.SALES));
    userProxy.save(User(username: 'mstooge', first: 'Moe', last: 'Stooge', email: 'moe@stooges.com', password: 'abc123', department: DeptEnum.PLANT));

    facade.registerProxy(userProxy);

    var roleProxy = RoleProxy();
    roleProxy.updateRoles('lstooge', [RoleEnum.PAYROLL, RoleEnum.EMP_BENEFITS]);
    roleProxy.updateRoles('cstooge', [RoleEnum.ACCT_PAY, RoleEnum.ACCT_RCV, RoleEnum.GEN_LEDGER]);
    roleProxy.updateRoles('mstooge', [RoleEnum.INVENTORY, RoleEnum.PRODUCTION, RoleEnum.SALES, RoleEnum.SHIPPING]);

    facade.registerProxy(roleProxy);
  }
}