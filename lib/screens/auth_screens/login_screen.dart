import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:saees_cards/helpers/functions_helper.dart';
import 'package:saees_cards/main.dart';
import 'package:saees_cards/providers/auth_provider.dart';
import 'package:saees_cards/widgets/cickables/main_button.dart';
import 'package:saees_cards/widgets/dialogs/flush_bar.dart';
import 'package:saees_cards/widgets/inputs/text_field_widget.dart';
import 'package:saees_cards/widgets/statics/header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController(
    text: kDebugMode ? "0926175513" : "",
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? "password" : "",
  );
  bool obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authConsumer, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: getSize(context).height * 0.05),
                        HeaderWidget(
                          title: "Login Without Subtitle",
                          subTitle:
                              "Login Without Subtitle Login Without Subtitle",
                        ),
                        SizedBox(height: getSize(context).height * 0.05),

                        TextFieldWidget(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.phone,
                          horizontalPadding: 0,
                          label: "Phone",
                          controller: phoneController,

                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Phone is Required";
                            }
                            if (v.length != 10) {
                              return "Phone must be 10 digts at least";
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          horizontalPadding: 0,
                          label: "Password",
                          obscureText: obsecurePassword,
                          suffixWidget: GestureDetector(
                            onTap: () {
                              setState(() {
                                obsecurePassword = !obsecurePassword;
                              });
                            },
                            child: Icon(Icons.visibility),
                          ),

                          controller: passwordController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Passwords is Required";
                            }
                            if (v.length < 8) {
                              return "Passwords must be 8 chars at least";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: getSize(context).height * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          floatingActionButton: MainButton(
            busy: authConsumer.busy,
            onTap: () {
              if (formKey.currentState!.validate()) {
                authConsumer
                    .login({
                      "phone": phoneController.text.substring(
                        1,
                        phoneController.text.length,
                      ),
                      "password": passwordController.text,
                      "device_name": Platform.isAndroid ? "Android" : "IOS",
                    })
                    .then((loginResponse) {
                      if (context.mounted) {
                        showCustomFlushBar(
                          context,
                          loginResponse.first ? "Success" : "Failed",
                          loginResponse.last,
                          loginResponse.first,
                        );
                      }
                      if (loginResponse.first) {
                        Timer(Duration(seconds: 3), () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ScreenRouter(),
                            ),
                            (route) => false,
                          );
                        });
                      }
                    });
              }
            },
            title: "Login",
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
