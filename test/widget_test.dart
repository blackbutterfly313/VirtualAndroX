import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_andro_x/main.dart';

void main() {
  testWidgets('VirtualAndroX basic test', (WidgetTester tester) async {
    // Simply build the app without any async operations
    await tester.pumpWidget(const VirtualAndroXApp());
    
    // Just verify it builds - no waiting for timers
    expect(find.byType(VirtualAndroXApp), findsOneWidget);
  });
}
