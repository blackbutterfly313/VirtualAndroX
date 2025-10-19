import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_andro_x/main.dart';

void main() {
  testWidgets('VirtualAndroX app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    
    // Initial pump to build the widget
    await tester.pump();
    
    // Wait for all timers to complete
    await tester.pumpAndSettle(const Duration(seconds: 5));
    
    // Verify the app is built
    expect(find.byType(VirtualAndroXApp), findsOneWidget);
  });

  testWidgets('Launch myBSN button exists after initialization', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    
    // Wait for the initialization to complete (2+2 seconds)
    await tester.pumpAndSettle(const Duration(seconds: 5));
    
    // Now the button should be enabled and visible
    expect(find.text('Launch myBSN Banking'), findsOneWidget);
    expect(find.text('System Ready'), findsOneWidget);
  });

  testWidgets('App shows initial loading state', (WidgetTester tester) async {
    await tester.pumpWidget(const VirtualAndroXApp());
    
    // Immediately after pump, we should see initial text
    expect(find.text('Initializing Android 11 Environment...'), findsOneWidget);
    
    // Fast-forward 2 seconds
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Loading myBSN Compatibility Layer...'), findsOneWidget);
    
    // Fast-forward another 2 seconds
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('System Ready - Huawei Nova 4 Optimized'), findsOneWidget);
  });
}
