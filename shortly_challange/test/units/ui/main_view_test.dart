import 'package:flutter_test/flutter_test.dart';
import 'package:shortly_challange/views/main/main_view.dart';

import '../controller/link_mock_controller.dart';
import 'main_mock_view.dart';

void main() {
  late LinkMockController _linkMockContoller;

  setUp(() {
    _linkMockContoller = LinkMockController();
  });

  testWidgets('Shorted Link Card Test', (tester) async {
    await tester.pumpWidget(MainMockView());
    await _linkMockContoller.shortenLink(link: 'https://google.com');
    expect(find.text('https://google.com'), findsOneWidget);
  });
}
