import 'package:flutter/material.dart';

class FormInput extends TextFormField {
  FormInput({
    super.key,
    required String hintText,
    required bool isPassword,
    required TextEditingController controller,
    required super.validator,
  }) : super(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
}
// TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Password is required';
//                     }
//                     return null;
//                   },
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Enter your password',
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.red.shade300,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.red.shade300,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade300,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Styles.primaryColor,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),