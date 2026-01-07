import 'package:flutter/material.dart';
import 'package:saees_cards/helpers/consts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title, this.subTitle});
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [Expanded(child: Text(title, style: displayMedium))],
        ),
        if (subTitle != null) SizedBox(height: 10),
        if (subTitle != null)
          Text(subTitle!, style: bodyMedium.copyWith(color: Colors.grey)),
      ],
    );
  }
}
