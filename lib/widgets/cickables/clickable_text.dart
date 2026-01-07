import 'package:flutter/material.dart';
import 'package:saees_cards/helpers/consts.dart';

import '../../helpers/consts.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    super.key,
    required this.text,
    required this.onTap,
    this.txtColors = primaryColor,
  });
  final String text;
  final Function onTap;
  final Color txtColors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: labelSmall.copyWith(color: txtColors))],
        ),
      ),
    );
  }
}
