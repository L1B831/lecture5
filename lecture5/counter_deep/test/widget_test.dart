import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_deep/main.dart';

void main() {
  testWidgets('点一次加2', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 初始没计数，走的是空状态
    expect(find.text('点右下角的按钮开始计数'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // 步长是2，点一下就该显示2
    expect(find.text('每点一次加2：'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}
