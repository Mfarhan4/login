import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint,required this.controller,required this.msg}) : super(key: key);
  final String hint;
  final String msg;
  final  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        validator:  (value){
          if(value!.isEmpty){
            return  msg;
          }
        },
        controller: controller,
        decoration: InputDecoration(
      hintText: hint,
border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.blue))
    ));
  }
}
