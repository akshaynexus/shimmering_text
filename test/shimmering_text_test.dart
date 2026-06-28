import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmering_text/shimmering_text.dart';

void main() {
  testWidgets('ShimmeringText renders its text', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: ShimmeringText('Hello'),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(ShaderMask), findsOneWidget);

    // Let the repeating animation advance, then settle so the test can finish.
    await tester.pump(const Duration(milliseconds: 500));
  });

  testWidgets('disabled ShimmeringText paints no ShaderMask', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: ShimmeringText('Hello', enabled: false),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(ShaderMask), findsNothing);
  });

  testWidgets('Shimmer wraps an arbitrary child', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Shimmer(child: Icon(Icons.star)),
      ),
    );

    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byType(ShaderMask), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 500));
  });
}
