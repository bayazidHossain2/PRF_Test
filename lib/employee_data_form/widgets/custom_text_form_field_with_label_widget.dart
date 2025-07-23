import 'package:flutter/material.dart';

class CustomTextFormFieldWithLabelWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isOptional;
  final Function(String)? onFormSubmitted;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool enabled;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextFormFieldWithLabelWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.isOptional = false,
    this.onFormSubmitted,
    this.onTap,
    this.onChanged,
    this.enabled = true,
    this.textStyle,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          enabled: enabled,
          style: textStyle,
          keyboardType: textInputType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ), // Default border color
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Icon(prefixIcon, color: Colors.grey),
            suffixIcon: suffixIcon == null
                ? null
                : Icon(suffixIcon, color: Colors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            // focusColor: ,
          ),
          validator: (value) {
            if (isOptional) {
              return null;
            }
            if (value!.isEmpty) {
              return '$labelText is required.';
            }
            return null;
          },
          onFieldSubmitted: onFormSubmitted,
        ),
      ],
    );
  }
}
