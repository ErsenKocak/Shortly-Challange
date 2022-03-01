import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/models/Result.dart';

class LinkMockService {
  final _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 120 * 1000,
      receiveTimeout: 120 * 1000));

  Future<Result?> shortenLink({required String link}) async {
    try {
      var response = await _dio.post('?url=$link');

      if (response.statusCode == HttpStatus.created) {
        return Result.fromJson(response.data);
      }
    } catch (error) {
      if (error is DioError) {
        return Result.fromJson(error.response!.data);
      }

      return null;
    }
  }
}
