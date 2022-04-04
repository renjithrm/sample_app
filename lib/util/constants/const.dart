import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget formField(
    {TextEditingController? controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    String? hindText,
    Icon? icon,
    Widget? suffixIcon,
    bool? obscureText}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 8,
      bottom: 8,
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.grey[400],
          hintText: hindText,
          prefixIcon: icon,
          suffixIcon: suffixIcon),
      obscureText: obscureText ?? false,
    ),
  );
}

final requriedValidation =
    RequiredValidator(errorText: "This field is requried");
