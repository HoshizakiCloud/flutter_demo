import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';
import 'package:hello_world/widgets/scaffold/app_scaffold.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.white,
      builder: (context, child) {
        return AppTheme(
          data: AppThemeData(),
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => FocusTraversalGroup(
                  policy: ReadingOrderTraversalPolicy(),
                  child: FocusScope(
                    autofocus: true,
                    child: AppScaffold(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}