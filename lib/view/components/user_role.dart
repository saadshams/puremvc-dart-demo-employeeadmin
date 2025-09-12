import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_admin/model/enum/role_enum.dart';
import 'package:employee_admin/view/employee_admin_mediator.dart';

class UserRole extends StatefulWidget {
  final String? username;

  const UserRole({super.key, required this.username});

  @override
  State<UserRole> createState() => _UserRoleState();
}

class _UserRoleState extends State<UserRole> {

  List<RoleEnum> roles = [];

  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final delegate = Provider.of<EmployeeAdminMediator>(context, listen: false);
      if (widget.username != null) {
        delegate.findRolesByUsername(widget.username!);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final delegate = Provider.of<EmployeeAdminMediator>(context);
    if (roles.isEmpty || !listEquals(roles, delegate.roles)) {
      setState(() {
        roles = List<RoleEnum>.from(delegate.roles);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          children: [
            Expanded(child: list()),
            const SizedBox(height: 16),
            Row(children: [cancel(), const SizedBox(width: 16,), ok(),])
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      itemCount: RoleEnum.values.length,
      itemBuilder: (context, index) {
        final role = RoleEnum.values[index];
        return CheckboxListTile(
          title: Text(role.label),
          value: roles.contains(role),
          onChanged: (checked) {
            setState(() {
              (checked ?? false) ? roles.add(role): roles.remove(role);
            });
          },
        );
      },
    );
  }

  Widget cancel() {
    return Expanded(
        child: ElevatedButton(
            onPressed: onCancel,
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red),
            child: const Text('CANCEL')
        )
    );
  }

  Widget ok() {
    return Expanded(
        child: ElevatedButton(
            onPressed: onOk,
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.green),
            child: const Text('OK')
        )
    );
  }

  void onOk() {
    final delegate = context.read<EmployeeAdminMediator>();
    delegate.roles = roles;
    if (mounted) Navigator.pop(context);
  }

  void onCancel() {
    if (mounted) Navigator.pop(context);
  }

}
