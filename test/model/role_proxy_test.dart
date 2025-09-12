import "package:test/test.dart";
import "package:employee_admin/model/role_proxy.dart";
import "package:employee_admin/model/enum/role_enum.dart";

void main() {

  group("Test RoleProxy", () {

    test("testRolesLength", () {
      RoleProxy roleProxy = RoleProxy();
      roleProxy.updateRoles('lstooge', [RoleEnum.empBenefits]);

      expect(roleProxy.roles.containsKey('lstooge'), true);
      expect(roleProxy.roles.containsKey('cstooge'), false);
      expect(roleProxy.roles['lstooge']?.length, 1);
      expect(roleProxy.roles['lstooge']?.first, RoleEnum.empBenefits);
    });

    test("testRemoveRole", () {
      RoleProxy roleProxy = RoleProxy();
      roleProxy.updateRoles('cstooge', [RoleEnum.acctRcv, RoleEnum.genLedger]);

      expect(roleProxy.roles.containsKey('cstooge'), true);
      expect(roleProxy.roles['cstooge']?.length, 2);

      roleProxy.removeRole('cstooge', RoleEnum.acctRcv);
      expect(roleProxy.roles['cstooge']?.length, 1);

      roleProxy.removeRole('cstooge', RoleEnum.inventory);
      expect(roleProxy.roles['cstooge']?.length, 1);

      roleProxy.removeRole('cstooge', RoleEnum.genLedger);
      expect(roleProxy.roles.containsKey('cstooge'), false);
    });

  });

}
