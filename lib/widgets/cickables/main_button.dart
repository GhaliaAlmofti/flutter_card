import 'package:flutter/material.dart';
import 'package:saees_cards/helpers/consts.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    required this.title,
    this.busy = false,
    this.isActive = true,
    this.horizontalPadding = 12,
    this.btnColor = primaryColor,
    this.txtColor = whiteColor,
    this.withBorder = false,
  });
  final Function onTap;
  final String title;
  final bool busy;
  final bool isActive;
  final double horizontalPadding;
  final Color btnColor;
  final Color txtColor;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 6),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
              side: withBorder
                  ? BorderSide(color: txtColor, width: 1)
                  : BorderSide.none,
            ),
          ),

          backgroundColor: WidgetStatePropertyAll(btnColor),
        ),
        onPressed: () {
          if (busy) {
            return;
          }
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: animationDuration,
                child: busy
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white38,
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(title, style: labelMedium.copyWith(color: txtColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
