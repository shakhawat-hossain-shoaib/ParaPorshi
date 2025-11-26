import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/core/router.dart';
import 'package:hyperlocal_hub_bd/features/services_directory/presentation/screens/services_list_screen.dart';

void main() {
  testWidgets('Service details tap navigates to details screen', (tester) async {
    final router = buildRouter();

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    // navigate to /services
    router.go('/services');
    await tester.pumpAndSettle();

    // find the first 'ডিটেইলস' button and tap
    final detailsButton = find.text('ডিটেইলস').first;
    expect(detailsButton, findsOneWidget);
    await tester.tap(detailsButton);
    await tester.pumpAndSettle();

    // Expect to find 'Jewel Electric' on the details screen
    expect(find.textContaining('Jewel Electric'), findsOneWidget);
  });
}
