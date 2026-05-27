import 'dart:ui';

import 'package:flutter/material.dart' show Colors, IconButton, Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/glass.dart';
import 'package:window_manager/window_manager.dart';

import '../components/text_input.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DragToMoveArea(
          child: SizedBox(
            height: 48,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8
                  )
                ]
              )
            )
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleButton(const Icon(Icons.minimize, color: Colors.white), windowManager.minimize),
                _titleButton(const Icon(Icons.close, color: Colors.white), windowManager.close),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _searchBox()
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  _createTaskButton()
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _createTaskButton() {
    return SizedBox(
      height: 36,
      width: 36,
      child: Glass(
        child: Center(
          child: AdaptiveThemedIcon(Icons.add, size: 18),
        ),
      ),
    );
  }

  Widget _searchBox() {
    return SizedBox(
      height: 36,
      child: Glass(
        child: Row(
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: Center(
                child: AdaptiveThemedIcon(
                  Icons.search,
                  size: 18,
                ),
              )
            ),
            Expanded(
              child: TextInput(
                textStyle: TextStyle(fontSize: 13)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleButton(Widget icon, VoidCallback onPressed) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton(
        iconSize: 16,
        onPressed: onPressed,
        icon: icon,
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      )
    );
  }
}