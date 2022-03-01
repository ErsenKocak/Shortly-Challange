import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shortly_challange/controllers/intro_view_controller.dart';
import 'package:shortly_challange/controllers/link_controller.dart';
import 'package:shortly_challange/core/app/constants.dart';
import 'package:shortly_challange/services/link_service.dart';

final getIt = GetIt.instance;
setupLocator() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 120 * 1000,
      receiveTimeout: 120 * 1000)));
  getIt.registerSingleton<IntroViewController>(IntroViewController());
  getIt.registerSingleton<LinkService>(LinkService());
  getIt.registerSingleton<LinkController>(LinkController());
}
