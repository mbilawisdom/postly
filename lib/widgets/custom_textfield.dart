import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget{

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final validator;

  CustomInputField({
    @required this.hint,
    @required this.isPassword,
    @required this.controller,
    this.keyboardType,
    this.validator,


  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      child:  Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 5),
          child:
          TextFormField(
              obscureText: isPassword ?? false,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                  border:  new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0)
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  hintText: hint,
                  focusColor: Colors.black,
                  fillColor: Colors.black12 ,
                  filled: true))),
    );
  }
}