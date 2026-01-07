import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saees_cards/helpers/consts.dart';
import 'package:saees_cards/main.dart';
import 'package:saees_cards/providers/auth_provider.dart';
import 'package:saees_cards/widgets/cickables/clickable_text.dart';
import 'package:saees_cards/widgets/cickables/main_button.dart';
import 'package:saees_cards/widgets/dialogs/flush_bar.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authConsumer, _) {
        return AlertDialog(
          title: Text("Logout"),

          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Are you sure you want to logout?"),

              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      busy: authConsumer.busy,
                      horizontalPadding: 0,
                      onTap: () {
                        authConsumer.logout().then((logoutResponse) {
                          if (context.mounted) {
                            showCustomFlushBar(
                              context,
                              logoutResponse.first ? "Success" : "Failed",
                              logoutResponse.last,
                              logoutResponse.first,
                            );
                          }

                          if (logoutResponse.first && context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ScreenRouter(),
                              ),
                              (route) => false,
                            );
                          }
                        });
                      },
                      title: "Logout",
                    ),
                  ),

                  Expanded(
                    child: ClickableText(
                      txtColors: redColor,
                      text: "Cancel",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
