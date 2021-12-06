import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shortly_challange/controllers/link_controller.dart';
import 'package:shortly_challange/core/init/locator.dart';
import 'package:shortly_challange/models/Result.dart';

class LinkService {
  final _dio = getIt<Dio>();
  final _logger = Logger();

  Future<Result?> shortenLink({required String link}) async {
    try {
      var response = await _dio.post('?url=$link');

      if (response.statusCode == HttpStatus.created) {
        return Result.fromJson(response.data);
      }
    } catch (error) {
      if (error is DioError) {
        _logger.e(error.response);
        return Result.fromJson(error.response!.data);
      }
      _logger.e(error);
      return null;
    }
  }
}
