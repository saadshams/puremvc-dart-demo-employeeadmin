import "package:test/test.dart";
import "package:employee_admin/model/role_proxy.dart";
import "package:employee_admin/model/enum/role_enum.dart";

void main() {

  group("Test RoleProxy", () {

    test("testRolesLength", () {
      RoleProxy roleProxy = RoleProxy();
      roleProxy.updateRoles('lstooge', [RoleEnum.EMP_BENEFITS]);

      expect(roleProxy.roles.containsKey('lstooge'), true);
      expect(roleProxy.roles.containsKey('cstooge'), false);
      expect(roleProxy.roles['lstooge']?.length, 1);
      expect(roleProxy.roles['lstooge']?.first, RoleEnum.EMP_BENEFITS);
    });

    test("testRemoveRole", () {
      RoleProxy roleProxy = RoleProxy();
      roleProxy.updateRoles('cstooge', [RoleEnum.ACCT_RCV, RoleEnum.GEN_LEDGER]);

      expect(roleProxy.roles.containsKey('cstooge'), true);
      expect(roleProxy.roles['cstooge']?.length, 2);

      roleProxy.removeRole('cstooge', RoleEnum.ACCT_RCV);
      expect(roleProxy.roles['cstooge']?.length, 1);

      roleProxy.removeRole('cstooge', RoleEnum.INVENTORY);
      expect(roleProxy.roles['cstooge']?.length, 1);

      roleProxy.removeRole('cstooge', RoleEnum.GEN_LEDGER);
      expect(roleProxy.roles.containsKey('cstooge'), false);
    });

  });

}
