import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'core/app/theme.dart';
import 'core/init/easy_loading_config/easy_loading_config.dart';
import 'core/init/locator.dart';
import 'views/first/first_view.dart';
import 'views/intro/intro_view.dart';
import 'views/main/main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  configLoading();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme(),
      title: 'Shortly Challange',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: [
        GetPage(name: '/intro', page: () => IntroView()),
        GetPage(name: '/first', page: () => FirstView()),
        GetPage(name: '/main', page: () => MainView()),
      ],
      initialRoute: '/first',
    );
  }
}
