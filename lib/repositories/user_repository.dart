import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserRepository {
  final Dio _dio;

  UserRepository({required Dio dio}) : _dio = dio;

  Future<List<UserModel>> getUsers() async {
    try {
      final result = await _dio.get('/users');

      return result.data
          .map<UserModel>((user) => UserModel.fromMap(user))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar usuários', error: e, stackTrace: s);
      throw Exception();
    }
  }
}
