import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_andro_x/main.dart';

void main() {
  test('VirtualAndroX basic structure', () {
    expect(VirtualAndroXApp.new, returnsNormally);
  });

  testWidgets('VirtualAndroX builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    await tester.pump(); // Single pump without waiting for timers
    
    // Just verify the app builds
    expect(find.byType(VirtualAndroXApp), findsOneWidget);
  });
}
