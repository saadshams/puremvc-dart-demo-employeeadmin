import "dart:async";

import "package:employeeadmin/ApplicationConstants.dart";
import "package:flutter/material.dart";

import "../../model/valueObject/Department.dart";
import "../../model/valueObject/User.dart";
import "../EventBus.dart";

class UserForm extends StatefulWidget {
  
  final User user;

  const UserForm({super.key, required this.user});

  @override
  State<UserForm> createState() => UserFormState();
}

class UserFormState extends State<UserForm> {

  late List<Department> _departments = []; // UI Data

  final _key = GlobalKey<FormState>(); // Input/Form Data
  final _username = TextEditingController();
  final _first = TextEditingController();
  final _last = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  Department? _selectedDepartment = Department.NONE_SELECTED;

  StreamController<Map<String, dynamic>>? stream; // Event Dispatcher

  @override
  void initState() {
    super.initState();
    EventBus().dispatch(ApplicationConstants.MOUNTED, this);
    stream?.add({
      "action": ApplicationConstants.USER_SELECTED,
      "detail": widget.user
    });
  }

  void setUser(User user) {
    _username.text = user.username;
    _first.text = user.first;
    _last.text = user.last;
    _email.text = user.email;
    _password.text = user.password;
    _confirm.text = user.password;
    print(user.department);
    setState(() {
      _selectedDepartment = user.department;
    });
  }

  void setDepartments(List<Department> departments) {
    setState(() {
      if (departments.isEmpty || departments[0] != Department.NONE_SELECTED) {
        departments.insert(0, Department.NONE_SELECTED);
      }
      _departments = departments;
    });
  }

  void _save() {
    if(_key.currentState!.validate()) {
      _key.currentState!.save();
    }
    _key.currentState!.reset();
  }

  void _cancel() {
    _key.currentState!.reset();
  }

  void roles() {
    print("go to roles");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("User Form"), backgroundColor: Colors.blue,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _first,
                        decoration: const InputDecoration(hintText: "First Name"),
                        validator: (value) { return value == null || value.isEmpty ? "Please enter a first name" : null; },
                        onSaved: (value) { _first.text = value!; } ,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _last,
                        decoration: const InputDecoration(hintText: "Last Name"),
                        validator: (value) { return value == null || value.isEmpty ? "Please enter a last name" : null; },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Please enter an email";
                          if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) return "Please enter a valid email";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _username,
                        decoration: const InputDecoration(hintText: "Username"),
                        validator: (value) { return value == null || value.isEmpty ? "Enter a username" : null; },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(hintText: "Password"),
                        obscureText: true,
                        validator: (value) { return value == null || value.isEmpty ? "Please enter a password" : null; },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: _confirm,
                          decoration: const InputDecoration(hintText: "Confirm Password"),
                          obscureText: true,
                          validator: (value) { return null; },
                        )
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<Department>(
                        decoration: const InputDecoration(hintText: "Department"),
                        value: widget.user.department,
                        items: _departments.map((Department department) {
                          return DropdownMenuItem<Department>(
                            value: department,
                            child: Text(department.toString()),
                          );
                        }).toList(),
                        onChanged: (Department? newValue) {
                          setState(() { _selectedDepartment = newValue!; });
                        },
                        validator: (value) { return value == null ? "Please select a department" : null; },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: ElevatedButton(onPressed: roles, child: const Text("ROLES")))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(
                        onPressed: _cancel,
                        child: const Text("Cancel")
                    )),
                    const SizedBox(width: 16),
                    Expanded(child: ElevatedButton(
                        onPressed: _save,
                        child: const Text("Save")
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _username.dispose();
    _password.dispose();
    _confirm.dispose();
    EventBus().dispatch(ApplicationConstants.UNMOUNTED, this);
    super.dispose();
  }
}
