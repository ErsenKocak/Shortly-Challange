import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:logger/logger.dart';
import 'package:shortly_challange/core/init/locator.dart';
import 'package:shortly_challange/models/ShortedLink.dart';
import 'package:shortly_challange/services/link_service.dart';

class LinkController extends GetxController {
  final _linkService = getIt<LinkService>();
  var linkIsValid = Rx<bool>(true);
  var isLoading = false.obs;
  var shortedLinks = <ShortedLink>[].obs;
  var copiedLink = "".obs;
  Future<void> shortenLink({required String link}) async {
    changeLoading();
    var response = await _linkService.shortenLink(link: link);

    if (response == null || response.ok == false) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(response!.error!),
      ));
    } else {
      shortedLinks.refresh();
      shortedLinks.add(response.result!);
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text('Transaction Successful'),
      ));
    }
    changeLoading();
  }

  changeLoading() {
    isLoading(!isLoading.value);
    if (isLoading.value == true) {
      EasyLoading.show();
      return;
    }
    EasyLoading.dismiss();
    return;
  }
}
