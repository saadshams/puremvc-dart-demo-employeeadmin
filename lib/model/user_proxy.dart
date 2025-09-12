import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/model/valueObject/user.dart';

class UserProxy extends Proxy {

  static const String NAME = 'UserProxy';

  UserProxy(): super(NAME, <User>[]);

  User? findByUsername(String username) {
    final int index = users.indexWhere((u) => u.username == username);
    return (index == -1) ? null : users[index];
  }

  void save(User user) {
    users.add(user);
  }

  void update(User user) {
    final int index = users.indexWhere((u) => u.username == user.username);
    if (index != -1) {
      users[index] = user;
    }
  }

  void delete(User user) {
    final int index = users.indexWhere((u) => u.username == user.username);
    if (index != -1) {
      users.removeAt(index);
    }
  }

  List<User> get users => data;

}