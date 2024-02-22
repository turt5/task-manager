import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(4, 4),
            spreadRadius: 1,
            blurRadius: 15),
        const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            spreadRadius: 1,
            blurRadius: 15)
      ]),
      child: TextField(
        controller: controller,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Enter your task here',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2)),
          )),
    );
  }
}
