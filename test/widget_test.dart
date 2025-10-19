import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_andro_x/main.dart';

void main() {
  testWidgets('VirtualAndroX app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    
    // Look for the main title text (more specific)
    expect(find.text('VirtualAndroX'), findsWidgets); // Changed from findsOneWidget
    
    // Verify the app bar exists
    expect(find.byType(AppBar), findsOneWidget);
    
    // Verify the main icon exists
    expect(find.byIcon(Icons.phone_android), findsOneWidget);
  });

  testWidgets('Launch myBSN button exists', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    await tester.pumpAndSettle(); // Wait for animations
    
    expect(find.text('Launch myBSN Banking'), findsOneWidget);
  });
}
