import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/scaffold/drawer/scroll_container.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.title,
    required this.children
  });

  final String title;
  final List<Widget> children;

  @override createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return SettingsPageScrollContainer(
      children: [
        SizedBox(
          height: 26,
          child: MouseRegion(
            onEnter: (event) => setState(() { isHover = true; }),
            onExit: (event) => setState(() { isHover = false; }),
            hitTestBehavior: HitTestBehavior.deferToChild,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: [
                  AnimatedSlide(
                    duration: Duration(milliseconds: 500),
                    offset: isHover ? .new(-.16, 0) : .zero,
                    curve: Curves.easeOutExpo,
                    child: AdaptiveThemedIcon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: isHover ? themeData.contentColorTertiary : themeData.contentColor
                    ),
                  ),
                  AdaptiveThemedText(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ...widget.children
      ]
    );
  }
}