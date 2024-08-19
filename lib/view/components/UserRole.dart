import 'package:flutter/material.dart';

import '../../ApplicationConstants.dart';
import '../EventBus.dart';

class UserRole extends StatefulWidget {
  const UserRole({super.key});

  @override
  State<UserRole> createState() => UserRoleState();
}

class UserRoleState extends State<UserRole> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    EventBus().dispatch(ApplicationConstants.UNMOUNTED, this);
    super.dispose();
  }
}
