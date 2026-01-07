import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saees_cards/helpers/consts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.label,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.prefixWidget,
    this.suffixWidget,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final String? label;
  final double horizontalPadding;
  final double verticalPadding;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(children: [Text(label!, style: labelSmall)]),
            ),
          TextFormField(
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: suffixWidget,
              prefixIcon: prefixWidget,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),

                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),

                borderRadius: BorderRadius.circular(16),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
