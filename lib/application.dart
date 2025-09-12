import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:employee_admin/application_facade.dart';
import 'package:employee_admin/view/components/user_list.dart';
import 'package:employee_admin/view/employee_admin_mediator.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EmployeeAdminMediator>.value(
            value: ApplicationFacade.getInstance(ApplicationFacade.KEY).retrieveMediator(EmployeeAdminMediator.NAME) as EmployeeAdminMediator,
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const UserList(),
        ));
  }
}
