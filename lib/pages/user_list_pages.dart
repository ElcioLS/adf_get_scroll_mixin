import 'package:adf_get_scroll_mixin/pages/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPages extends StatelessWidget {
  final controller = Get.find<UserListController>();

  UserListPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: controller.obx((state) {
          return ListView.builder(
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              final user = state?[index];
              return ListTile(
                title: Text(user?.name ?? ''),
                subtitle: Text(user?.email ?? ''),
              );
            },
          );
        }));
  }
}
