import 'package:adf_get_scroll_mixin/pages/user_list_controller.dart';
import 'package:adf_get_scroll_mixin/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/user_list_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Scroll Mixin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(
          () => Dio(
            BaseOptions(
              baseUrl: 'http://192.168.0.5:8080',
            ),
          ),
          fenix: true,
        );

        Get.lazyPut(
          () => UserRepository(
            dio: Get.find(),
          ),
          fenix: true,
        );
      }),
      getPages: [
        GetPage(
            name: '/',
            binding: BindingsBuilder.put(() => UserListController(
                  userRepository: Get.find(),
                )),
            page: () => UserListPages())
      ],
    );
  }
}
