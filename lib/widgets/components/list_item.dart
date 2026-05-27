import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/components/adaptive_themed_icon.dart';
import 'package:hello_world/widgets/components/adaptive_themed_text.dart';
import 'package:hello_world/widgets/components/surface.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    this.onTap,
    required this.title,
    this.iconData,
    this.description,
    this.endArrow,
    this.clickable
  });

  final Function()? onTap;

  final String title;
  final IconData? iconData;
  final String? description;
  final bool? endArrow;
  final bool? clickable;

  @override
  Widget build(BuildContext context) {
    List<Widget> result = [];

    if (iconData != null) {
      result.add(
        Center(
          child: AdaptiveThemedIcon(
            iconData!,
            size: 20,
          ),
        ),
      );
    }

    if (description != null) {
      result.add(
        Padding(
          padding: .symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AdaptiveThemedText(
                title,
                style: TextStyle(
                  fontSize: 12
                )
              ),
              SizedBox(
                height: 2
              ),
              AdaptiveThemedText(
                description!,
                contrast: .secondary,
                style: TextStyle(
                  fontSize: 9
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      result.add(
        Padding(
          padding: .symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AdaptiveThemedText(
                title,
                style: TextStyle(
                  fontSize: 12
                )
              ),
            ],
          ),
        ),
      );
    }

    if(endArrow == true) {
      result.add(Spacer());
      result.add(
        AdaptiveThemedIcon(
          Icons.arrow_forward_ios_sharp,
          size: 12,
        )
      );
    }
    return SizedBox(
      height: description == null ? 36 : 48,
      child: GestureDetector(
        onTap: onTap,
        child: Surface(
          child: Padding(
            padding: .symmetric(horizontal: 12),
            child: Row(
              children: result
            ),
          ),
        ),
      ),
    );
  }
}