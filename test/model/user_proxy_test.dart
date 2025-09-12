import "package:test/test.dart";
import 'package:employee_admin/model/user_proxy.dart';
import 'package:employee_admin/model/enum/dept_enum.dart';
import 'package:employee_admin/model/valueObject/user.dart';

void main() {

  group("Test UserProxy", () {

    test("testUsersLength", () {
      UserProxy userProxy = UserProxy();

      userProxy.save(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));
      userProxy.save(User(username: 'cstooge', first: 'Curly', last: 'Stooge', email: 'curly@stooges.com', password: 'xyz987', department: DeptEnum.SALES));
      userProxy.save(User(username: 'mstooge', first: 'Moe', last: 'Stooge', email: 'moe@stooges.com', password: 'abc123', department: DeptEnum.PLANT));

      expect(userProxy.users.length, 3);
    });

    test("testUpdateUser", () {
      UserProxy userProxy = UserProxy();

      userProxy.save(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));
      userProxy.update(User(username: 'lstooge', first: 'Larry1', last: 'Stooge1', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));

      User updated = userProxy.users[0];
      expect(updated.first, "Larry1");
      expect(updated.last, "Stooge1");
    });
    
    test("testDeleteUser", () {
      UserProxy userProxy = UserProxy();

      userProxy.save(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));
      userProxy.save(User(username: 'cstooge', first: 'Curly', last: 'Stooge', email: 'curly@stooges.com', password: 'xyz987', department: DeptEnum.SALES));
      userProxy.save(User(username: 'mstooge', first: 'Moe', last: 'Stooge', email: 'moe@stooges.com', password: 'abc123', department: DeptEnum.PLANT));

      // Delete Curly
      userProxy.delete(User(username: 'cstooge', first: 'Curly', last: 'Stooge', email: 'curly@stooges.com', password: 'xyz987', department: DeptEnum.SALES));
      expect(userProxy.users.length, 2);

      int index = userProxy.users.indexWhere((u) => u.first == "Curly");
      expect(index, -1);

      // Delete Larry
      userProxy.delete(User(username: 'lstooge', first: 'Larry', last: 'Stooge', email: 'larry@stooges.com', password: 'ijk456', department: DeptEnum.ACCT));
      expect(userProxy.users.length, 1);

      index = userProxy.users.indexWhere((u) => u.first == "Larry");
      expect(index, -1);

      // Delete Moe
      userProxy.delete(User(username: 'mstooge', first: 'Moe', last: 'Stooge', email: 'moe@stooges.com', password: 'abc123', department: DeptEnum.PLANT));
      expect(userProxy.users.length, 0);

      index = userProxy.users.indexWhere((u) => u.first == "Moe");
      expect(index, -1);
    });

  });

}