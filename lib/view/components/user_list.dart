import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:employee_admin/view/employee_admin_mediator.dart';
import 'package:employee_admin/view/components/user_form.dart';
import 'package:employee_admin/model/valueObject/user.dart';

class UserList extends StatefulWidget {

  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final delegate = Provider.of<EmployeeAdminMediator>(context, listen: false);
      delegate.findAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List'), backgroundColor: Colors.blue,),
      body: list(),
      floatingActionButton: FloatingActionButton(onPressed: onNew, child: const Icon(Icons.add),),
    );
  }

  Widget list(){
    final delegate = context.watch<EmployeeAdminMediator>();
    return ListView.builder(
      itemCount: delegate.users.length,
      itemBuilder: (context, index) {
        final user = delegate.users[index];
        return ListTile(
          title: Text(user.toString()),
          trailing: IconButton(onPressed: () => onDelete(context, user), icon: const Icon(Icons.delete, color: Colors.red)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => UserForm(username: user.username)));
          },
        );
      },
    );
  }

  void onNew() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const UserForm(username: null)));
  }

  void onDelete(BuildContext context, User user) {
    final delegate = Provider.of<EmployeeAdminMediator>(context, listen: false);
    delegate.delete(user);
  }

}
