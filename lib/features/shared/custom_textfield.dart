import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.obscure = false,
    required this.hint,
    required this.controller,
  });

  final String hint;
  final bool obscure;
  final TextEditingController controller;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _hidePassword;
  @override
  void initState() {
    _hidePassword = widget.obscure;
    super.initState();
  }

  void togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please Fill ${widget.hint}';
        }

        return null;
      },
      controller: widget.controller,
      obscureText: _hidePassword,

      cursorColor: AppColors.secondary,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.white),
        ),

        suffix: widget.obscure
            ? GestureDetector(
                onTap: () {
                  togglePassword();
                },
                child: Icon(CupertinoIcons.eye),
              )
            : null,
        label: Text(
          widget.hint,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),

        fillColor: Colors.white,
        // filled: true,
      ),
    );
  }
}
