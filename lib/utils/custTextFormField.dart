import 'package:flutter/material.dart';

class CustTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  // final inputType;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isVisible;
  final VoidCallback? toggleVisibility;

  const CustTextFormField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.obscureText = false,
      this.validator,
      this.isVisible = false,
      this.toggleVisibility});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText && isVisible,
      validator: validator,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.bold),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 226, 222, 209)),
          suffixIcon: toggleVisibility != null
              ? IconButton(
                  onPressed: toggleVisibility,
                  icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: isVisible
                          ? const Color.fromARGB(255, 123, 100, 22)
                          : const Color.fromARGB(255, 227, 225, 225)))
              : null,
          focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 182, 146, 29)))),
    );
  }
}


























                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Confirm your Password';
                      //     }
                      //     return null;
                      //   },
                      //   obscureText: _isPasswordVisible == false ? true : false,
                      //   controller: cpassw,
                      //   decoration: InputDecoration(
                      //     hintText: 'password',
                      //     hintStyle: const TextStyle(
                      //         color: Color.fromARGB(255, 226, 222, 209)),
                      //     labelText: 'Password',
                      //     labelStyle: const TextStyle(
                      //         color: Colors.yellow,
                      //         fontWeight: FontWeight.bold),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         _isPasswordVisible
                      //             ? Icons.visibility
                      //             : Icons.visibility_off,
                      //         color: _isPasswordVisible == false
                      //             ? const Color.fromARGB(255, 227, 225, 225)
                      //             : const Color.fromARGB(255, 123, 100, 22),
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           _isPasswordVisible = !_isPasswordVisible;
                      //         });
                      //       },
                      //     ),
                      //     focusedBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 182, 146, 29)),
                      //     ),
                      //   ),
                      // ),