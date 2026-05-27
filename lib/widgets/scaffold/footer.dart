import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/app_theme.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/components/glass.dart';
import 'package:hello_world/widgets/components/surface.dart';
import 'package:hello_world/widgets/scaffold/drawer/settings_drawer.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  bool drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Glass(
      border: false,
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      child: Column(
        mainAxisSize: .min,
        children: [
          _buildToolbar(context),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: drawerOpen ? 1.0 : 0.0,
            ),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutExpo,
            builder: (context, value, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: value,
                  child: child,
                ),
              );
            },
            child: SettingsDrawer(),
          ),
        ]
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: .circular(8)),
          border: Border.all(color: AppTheme.of(context).glassBorderColor),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .16),
              blurRadius: 8,
              blurStyle: .outer
            )
          ]
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildToolbarContent(context)
          ],
        ),
      ),
    );
  }

  Widget _buildToolbarContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AdaptiveThemedText(
            '384KB/s',
            style: TextStyle(
              fontSize: 12
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
                  setState(() {
                    drawerOpen = !drawerOpen;
                  });
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