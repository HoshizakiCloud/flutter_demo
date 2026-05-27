import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/components/list_item.dart';
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
          return ListItem(
            iconData: Icons.download,
            title: '下载文件 $index',
            description: '10MB - bluecandle.net - 9:41',
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8)
      ),
    );
  }
}
