import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_andro_x/main.dart';

void main() {
  testWidgets('VirtualAndroX app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    expect(find.text('VirtualAndroX'), findsOneWidget);
  });
}
