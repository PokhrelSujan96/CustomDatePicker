// ignore_for_file: camel_case_types

import 'package:customcalendar/Components/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool obsecureText;

  final String? Function(String?)? validator;

  const customTextField(
      {super.key,
      this.controller,
      required this.hint,
      required this.obsecureText,
      this.validator,
      this.initialValue,
      this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      width: MediaQuery.of(context).size.width.w,
      child: Center(
        child: TextFormField(
          initialValue: initialValue,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          keyboardType: TextInputType.number ,
          style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blue.withOpacity(0.03),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: black, width: 1.5.r)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            label: Text(hint),
            labelStyle: TextStyle(
                fontSize: 11.sp, fontWeight: FontWeight.w400, color: black),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: black, width: 1.5.r),
            ),
            focusColor: purple,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5.r, color: black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: black,
                width: 1.5.r,
              ),
            ),
          ),
          enabled: true,
          obscureText: obsecureText,
        ),
      ),
    );
  }
}
