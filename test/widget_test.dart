// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timekeeper_app/screen/base_layout_screen.dart';
import 'package:timekeeper_app/util/time_helpers.dart';

void main() {
  test('formats hours, minutes, and seconds', () {
    expect(
      TimeHelpers.durationToHmsString(
        duration: const Duration(
          hours: 1,
          minutes: 2,
          seconds: 3,
          milliseconds: 987,
        ),
      ),
      '01:02:03',
    );
  });

  testWidgets('timer is reachable from navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BaseLayout()));

    await tester.tap(find.byIcon(Icons.timer_outlined));
    await tester.pump();

    expect(find.text('24:30:45'), findsOneWidget);
  });
}
