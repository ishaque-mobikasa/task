import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/validation.dart';

enum FieldType { eMail, password, normalInputField, phoneNumber }

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final double? borderRadius;
  final FieldType type;
  final String? hintText;
  final IconData? icon;
  final IconData? postFixIcon;
  final bool? obscureText;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final VoidCallback? toggleVisibility;
  // final void Function(void) onToggle;
  const CustomFormField(
      {this.obscureText,
      this.borderRadius,
      this.toggleVisibility,
      this.postFixIcon,
      this.validator,
      this.padding = const EdgeInsets.all(5),
      this.controller,
      required this.type,
      this.hintText = "E-mail",
      super.key,
      this.icon = Icons.email});
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding,
      child: TextFormField(
          controller: controller,
          inputFormatters: [
            type == FieldType.eMail
                ? LengthLimitingTextInputFormatter(30)
                : type == FieldType.normalInputField
                    ? LengthLimitingTextInputFormatter(15)
                    : type == FieldType.phoneNumber
                        ? LengthLimitingTextInputFormatter(10)
                        : LengthLimitingTextInputFormatter(20),
            type == FieldType.normalInputField
                ? FilteringTextInputFormatter.allow(RegExp("[A-Z a-z]"))
                : type == FieldType.phoneNumber
                    ? FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    : FilteringTextInputFormatter.deny(RegExp("")),
          ],
          keyboardType: type == FieldType.eMail
              ? TextInputType.emailAddress
              : type == FieldType.password
                  ? TextInputType.name
                  : type == FieldType.phoneNumber
                      ? TextInputType.phone
                      : TextInputType.name,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(
                icon,
                color: Colors.deepPurple,
              ),
              suffixIcon: type == FieldType.password
                  ? IconButton(
                      icon: Icon(postFixIcon ?? Icons.visibility_off),
                      onPressed: toggleVisibility,
                      color: Colors.black,
                    )
                  : null,
              hintText: hintText,
              labelText: hintText,
              labelStyle: const TextStyle(color: Colors.deepPurple),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorStyle: const TextStyle(color: Colors.blue),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: Colors.deepPurple)),
              contentPadding:
                  EdgeInsets.only(left: 0, top: 0, bottom: height * 0.02),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)))),
          validator: validator ??
              (type == FieldType.eMail
                  ? (value) {
                      if (value!.isEmpty) {
                        return "$hintText Cant be empty";
                      } else if (value.length < 4) {
                        return "$hintText Must be greater than 4 charactors long";
                      } else if (!value.isValidEmail &&
                          !RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
                              .hasMatch(value)) {
                        return "Invalid Email/Phone Number";
                      } else {
                        return null;
                      }
                    }
                  : type == FieldType.password
                      ? (value) {
                          if (value == '' || value == null) {
                            return "$hintText Cant be empty";
                          } else if (value.length < 8) {
                            return "Password Must be greater than 8 charactors";
                          } else if (!value.isValidPassword) {
                            return "Must contain an Uppercase,Lowercase,a special char & 1 digit";
                          } else {
                            return null;
                          }
                        }
                      : type == FieldType.normalInputField
                          ? (value) {
                              if (value == '' || value == null) {
                                return "$hintText Cant be empty";
                              } else if (value.length < 4 ||
                                  value.length > 16) {
                                return "User Name must be 4-14 Charactors";
                              } else {
                                return null;
                              }
                            }
                          : (value) {
                              if (value == '' || value == null) {
                                return "$hintText Cant be empty";
                              } else if (value.length < 10) {
                                return "Phone number Invalid";
                              } else {
                                return null;
                              }
                            })),
    );
  }
}
