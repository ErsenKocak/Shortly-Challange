import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortly_challange/core/init/locator.dart';
import 'package:shortly_challange/models/ShortedLink.dart';
import 'package:shortly_challange/services/link_service.dart';

import '../service/link_mock_service.dart';

class LinkMockController extends GetxController {
  late LinkMockService _linkMockService;
  var shortedLinks = <ShortedLink>[].obs;

  Future<ShortedLink> shortenLink({required String link}) async {
    _linkMockService = LinkMockService();
    var response = await _linkMockService.shortenLink(link: link);

    if (response == null || response.ok == false) {
      throw NullThrownError();
    } else {
      shortedLinks.refresh();
      shortedLinks.add(response.result!);
      return response.result!;
    }
  }

  void removeFromShortenLink(ShortedLink shortedLink) {
    shortedLinks.remove(shortedLink);
  }
}
