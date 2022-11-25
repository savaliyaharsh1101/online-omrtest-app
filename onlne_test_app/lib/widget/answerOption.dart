import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option extends StatefulWidget {
  final RxBool Selected;
  final String option;
  final String OptionText;
  Option(
      {super.key,
      required this.Selected,
      required this.OptionText,
      required this.option});
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: widget.Selected.value
                ? const Color.fromARGB(255, 0, 122, 109)
                : const Color(0xff00AB99)),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "${widget.option}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            alignment: Alignment.center,
            height: 65,
            width: 35,
            decoration: BoxDecoration(
                color: widget.Selected.value
                    ? Color.fromARGB(255, 0, 122, 109)
                    : const Color(0xff00AB99)),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${widget.OptionText}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
