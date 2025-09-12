import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:employee_admin/view/employee_admin_mediator.dart';
import 'package:employee_admin/view/components/user_role.dart';
import 'package:employee_admin/model/enum/dept_enum.dart';

import 'package:employee_admin/model/valueObject/user.dart';

class UserForm extends StatefulWidget {
  final String? username;

  const UserForm({super.key, required this.username});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late EmployeeAdminMediator delegate;

  final _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  DeptEnum? _department;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      delegate = Provider.of<EmployeeAdminMediator>(context, listen: false);
      final username = widget.username;
      if (username != null) {
        delegate.findByUsername(username);
      } else {
        delegate.user = null;
      }

      final user = delegate.user;
      _firstController.text = user?.first ?? '';
      _lastController.text = user?.last ?? '';
      _usernameController.text = user?.username ?? '';
      _emailController.text = user?.email ?? '';
      _passwordController.text = user?.password ?? '';
      _confirmController.text = user?.password ?? '';
      setState(() {
        _department = user?.department;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Form'), backgroundColor: Colors.blue),
      body: Padding(padding: const EdgeInsets.all(16), child: form())
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget form() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Row(children: [first(), const SizedBox(width: 16,), last(),],),
            Row(children: [username(), const SizedBox(width: 16,), email(),],),
            Row(children: [password(), const SizedBox(width: 16,), confirm(),],),
            Row(children: [department(), const SizedBox(width: 16,), roles()],),
            Row(children: [cancel(), const SizedBox(width: 16, height: 70,), save(),],),
          ],
        )
    );
  }

  Widget first() {
    return Expanded(
      child: TextFormField(
        controller: _firstController,
        decoration: const InputDecoration(labelText: 'First'),
      )
    );
  }

  Widget last() {
    return Expanded(
      child: TextFormField(
        controller: _lastController,
        decoration: const InputDecoration(labelText: 'Last'),
        validator: (value) => (value == null || value.isEmpty) ? 'Please enter a first name' : null,
      ),
    );
  }

  Widget username() {
    return Expanded(
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(labelText: 'Username'),
        validator: (value) => (value == null || value.isEmpty) ? 'Please enter a username' : null,
      )
    );
  }

  Widget email() {
    return Expanded(
        child: TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (value) => (value == null || value.isEmpty) ? 'Please enter an email'
              : (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) ? 'Please enter a valid email' : null),
        )
    );
  }

  Widget password() {
    return Expanded(
        child: TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: (value) => (value == null || value.isEmpty) ? 'Please enter a password' : null,
        )
    );
  }

  Widget confirm() {
    return Expanded(
        child: TextFormField(
          controller: _confirmController,
          decoration: const InputDecoration(labelText: 'Confirm'),
          obscureText: true,
          validator: (value) => (value == null || value.isEmpty) ? 'Please confirm password'
              : (value != _passwordController.text ? 'Passwords do not match' : null),
        )
    );
  }

  Widget department() {
    return Expanded(
      child: DropdownButtonFormField<DeptEnum>(
        decoration: const InputDecoration(labelText: 'Department'),
        value: _department,
        items: DeptEnum.values.map((DeptEnum dept){
          return DropdownMenuItem<DeptEnum>(value: dept, child: Text(dept.label));
        }).toList(),
        onChanged: (DeptEnum? newValue) => setState(() => _department = newValue),
        validator: (value) => (value == null) ? 'Please select a department' : null,
      ),
    );
  }

  Widget roles() {
    return Expanded(
        child: ElevatedButton(
            onPressed: onRoles,
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.grey),
            child: const Text('ROLES')
        )
    );
  }

  Widget save() {
    return Expanded(
      child: ElevatedButton(
        onPressed: onSave,
        style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.green),
        child: const Text('SAVE'),
      ),
    );
  }

  Widget cancel() {
    return Expanded(
        child: ElevatedButton(
          onPressed: onCancel,
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue),
          child: const Text('CANCEL'),
        )
    );
  }

  void alert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm'),
        actions: [
          TextButton(onPressed: onCancel, child: const Text('Cancel')),
          ElevatedButton(onPressed: onSave, child: const Text('Save')),
        ],
      ),
    );
  }

  void onSave() {
    final delegate = context.read<EmployeeAdminMediator>();
    if (_formKey.currentState!.validate()) {
      final user = User(
        username: _usernameController.text,
        first: _firstController.text,
        last: _lastController.text,
        email: _emailController.text,
        password: _passwordController.text,
        department: _department,
      );

      widget.username == null ? delegate.save(user) : delegate.update(user);
      delegate.updateRolesByUsername(user.username!, delegate.roles);

      if (mounted) Navigator.pop(context);
    }
  }

  void onCancel() {
    final delegate = context.read<EmployeeAdminMediator>();
    delegate.user = null;
    _usernameController.clear();
    _firstController.clear();
    _lastController.clear();
    _emailController.clear();
    _passwordController.clear();
    Navigator.pop(context);
  }

  void onRoles() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => UserRole(username: widget.username),
    );
  }

  @override
  void dispose() {
    delegate.user = null;
    _usernameController.dispose();
    _firstController.dispose();
    _lastController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

}
