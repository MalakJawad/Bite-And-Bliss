import 'package:flutter_test/flutter_test.dart';
import 'package:bite_and_bliss/main.dart';

void main() {
  testWidgets('App loads and counter increments', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const BiteAndBlissApp());

    // Example test - adjust to your HomePage content
    expect(find.text('Welcome to Bite & Bliss'), findsOneWidget);
    expect(find.text('Order Now'), findsOneWidget);
  });
}
