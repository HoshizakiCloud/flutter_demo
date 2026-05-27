import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/components/list_item.dart';
import 'package:hello_world/widgets/components/surface.dart';
import 'package:hello_world/widgets/components/text_input.dart';
import 'package:hello_world/widgets/scaffold/drawer/scroll_container.dart';

class SettingsPageHome extends StatelessWidget {
  const SettingsPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsPageScrollContainer(
      children: [
        SizedBox(
          height: 26,
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: AdaptiveThemedText(
              '设置',
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w800
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        _buildSearchBox(),
        SizedBox(height: 12),
        _buildEntries(context),
        SizedBox(height: 12),
        ListItem(
          title: '关于Photon',
          endArrow: true,
          onTap: () => Navigator.of(context).pushNamed('/about')
        )
      ],
    );
  }

  Widget _buildEntries(BuildContext context) {
    return Column(
      children: [
        ListItem(
          iconData: Icons.settings,
          title: '常规',
          description: '文件保存位置、同时下载数',
          endArrow: true,
          onTap: () => Navigator.of(context).pushNamed('/generics')
        ),
        SizedBox(height: 8),
        ListItem(
          iconData: Icons.web,
          title: '界面',
          description: '主题、强调色',
          endArrow: true,
          onTap: () => Navigator.of(context).pushNamed('/interface')
        ),
        SizedBox(height: 8),
        ListItem(
          iconData: Icons.download,
          title: '下载',
          description: '线程数、并发上限、速度限制',
          endArrow: true,
          clickable: true,
          onTap: () => Navigator.of(context).pushNamed('/downloading')
        ),
        SizedBox(height: 8),
        ListItem(
          iconData: Icons.build,
          title: '高级',
          description: '自定义请求头、日志级别',
          endArrow: true,
          onTap: () => Navigator.of(context).pushNamed('/advanced')
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Surface(
      child: Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: Center(
              child: AdaptiveThemedIcon(
                Icons.search,
                size: 16,
              )
            )
          ),
          Expanded(child: TextInput(textStyle: TextStyle(fontSize: 13)))
        ],
      )
    );
  }
}