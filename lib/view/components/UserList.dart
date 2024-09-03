import "package:employeeadmin/ApplicationConstants.dart";
import "package:employeeadmin/view/EventBus.dart";
import "package:flutter/material.dart";

import "../../model/valueObject/User.dart";
import "UserForm.dart";

class UserList extends StatefulWidget {

  const UserList({super.key});

  @override
  State<UserList> createState() => UserListState();
}

class UserListState extends State<UserList> {

  Future<List<User>>? users;

  @override
  void initState() {
    super.initState();
    EventBus().dispatch(ApplicationConstants.USER_LIST_MOUNTED, this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List"), backgroundColor: Colors.blue),
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: users,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No users found"));
            }

            List<User> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                User user = data[index];
                return ListTile(
                  title: Text(user.toString()),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => UserForm(user: user)
                    ))
                  },
                );
              },
            );
          }
        )
      )
    );
  }

  @override
  void dispose() {
    EventBus().dispatch(ApplicationConstants.USER_LIST_UNMOUNTED, this);
    super.dispose();
  }

}
