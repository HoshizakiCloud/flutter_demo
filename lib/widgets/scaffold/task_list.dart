import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/components/surface.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return DynMouseScroll(
      builder: (context, controller, physics) => ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 80, 16, 72),
        controller: controller,
        physics: physics,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListItem(id: index);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 6)
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int id;

  const ListItem({
    super.key,
    this.id = 0
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Surface(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(12, 12, 6, 12),
              child: AdaptiveThemedIcon(Icons.download)
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdaptiveThemedText(
                    '下载文件 $id',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Microsoft YaHei UI'
                    )
                  ),
                  SizedBox(height: 2),
                  AdaptiveThemedText(
                    '10MB - bluecandle.net - 9:41',
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'Microsoft YaHei UI'
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}