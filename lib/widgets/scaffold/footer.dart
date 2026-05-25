import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/app_theme.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/components/glass.dart';
import 'package:hello_world/widgets/components/surface.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Glass(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      child: _buildSpeedbar(context),
    );
  }

  Widget _buildSpeedbar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildSpeedbarContent(context)
        ],
      ),
    );
  }

  Widget _buildSpeedbarContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AdaptiveThemedText(
            '384KB/s',
            style: TextStyle(
              fontSize: 13
            ),
          ),
        ),
        SizedBox(
          width: 56,
          child: Center(
            child: SizedBox(
              height: 36,
              width: 36,
              child: GestureDetector(
                onTap: () {
                  final current = AppTheme.of(context);
                  AppTheme.updateTheme(context, AppThemeData(
                    primaryColor: current.primaryColor,
                    darkMode: !current.darkMode,
                  ));
                },
                child: Surface(
                  child: Center(
                    child: AdaptiveThemedIcon(
                      Icons.settings,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
