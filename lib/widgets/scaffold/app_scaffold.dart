import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';
import 'header.dart';
import 'footer.dart';
import 'task_list.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
          ),
        ),
        TaskList(),
        Stack(
          children: [
            Align(
              alignment: .bottomCenter,
              child: Footer()
            ),
            Align(
              alignment: .topCenter,
              child: Header()
            )
          ],
        )
      ],
    );
  }
}