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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controller.atualizar();
        //   },
        // ),
        body: controller.obx((state) {
          final totaltems = (state?.length ?? 0);
          return ListView.builder(
            controller: controller.scroll,
            itemCount: totaltems + 1,
            itemBuilder: (context, index) {
              if (index == totaltems) {
                return Obx(() {
                  return Visibility(
                    visible: controller.isLoading,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Carregando novos usuários',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                });
              }

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
