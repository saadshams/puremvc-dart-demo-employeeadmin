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
    userProxy.save(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.acct));
    userProxy.save(User(username: 'cstooge', first: 'Curly', last: 'Stooge', email: 'curly@stooges.com', password: 'xyz987', department: DeptEnum.sales));
    userProxy.save(User(username: 'mstooge', first: 'Moe', last: 'Stooge', email: 'moe@stooges.com', password: 'abc123', department: DeptEnum.plant));

    facade.registerProxy(userProxy);

    var roleProxy = RoleProxy();
    roleProxy.updateRoles('lstooge', [RoleEnum.payroll, RoleEnum.empBenefits]);
    roleProxy.updateRoles('cstooge', [RoleEnum.acctPay, RoleEnum.acctRcv, RoleEnum.genLedger]);
    roleProxy.updateRoles('mstooge', [RoleEnum.inventory, RoleEnum.production, RoleEnum.sales, RoleEnum.shipping]);

    facade.registerProxy(roleProxy);
  }
}