import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_challange/models/Result.dart';
import 'package:shortly_challange/models/ShortedLink.dart';

import 'link_mock_service.dart';

void main() {
  late LinkMockService _linkMockService;

  setUp(() {
    _linkMockService = LinkMockService();
  });

  test('Shorten Link Service Test', () async {
    final response =
        await _linkMockService.shortenLink(link: 'https://vitrineluxury.com');

    expect(response, isNotNull);
    expect(response is Result, true);
    expect(response!.result is ShortedLink, true);
    expect(response.result!.fullShareLink, isNotEmpty);
  });
}
