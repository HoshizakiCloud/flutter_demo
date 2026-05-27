import 'package:flutter/widgets.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class SettingsPageScrollContainer extends StatelessWidget {
  const SettingsPageScrollContainer({
    super.key,
    required this.children
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DynMouseScroll(
      builder: (context, controller, physics) => ListView(
        padding: .all(16),
        shrinkWrap: true,
        controller: controller,
        physics: physics,
        children: children,
      )
    );
  }
}