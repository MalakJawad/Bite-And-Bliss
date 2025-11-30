import 'package:flutter_test/flutter_test.dart';
import 'package:bite_and_bliss/main.dart';

void main() {
  testWidgets('HomePage loads', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const BiteAndBlissApp());

    // Example test: check for key text in HomePage
    expect(find.text('About Us'), findsOneWidget);
    expect(find.text('Get in Touch'), findsOneWidget);
  });
}
