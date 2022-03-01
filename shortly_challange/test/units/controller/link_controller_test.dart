import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_challange/models/ShortedLink.dart';

import '../service/link_mock_service.dart';
import 'link_mock_controller.dart';

void main() {
  late LinkMockController _linkMockController;

  setUp(() {
    _linkMockController = LinkMockController();
  });

  test('ShortenLink Response Test', () async {
    final response =
        await _linkMockController.shortenLink(link: 'https://google.com');

    expect(response, isNotNull);
    expect(response is ShortedLink, true);
    expect(_linkMockController.shortedLinks, isNotEmpty);
  });

  test('ShortenLink List Add Test', () async {
    final response =
        await _linkMockController.shortenLink(link: 'https://google.com');

    expect(_linkMockController.shortedLinks, isNotEmpty);
    expect(_linkMockController.shortedLinks.contains(response), true);
  });

  test('ShortenLink List Remove Test', () async {
    final response =
        await _linkMockController.shortenLink(link: 'https://google.com');

    expect(_linkMockController.shortedLinks, isNotEmpty);
    expect(_linkMockController.shortedLinks.contains(response), true);
    _linkMockController.removeFromShortenLink(response);
    expect(_linkMockController.shortedLinks.contains(response), false);
  });
}
