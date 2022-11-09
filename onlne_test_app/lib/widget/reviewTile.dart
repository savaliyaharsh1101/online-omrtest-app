import 'dart:ui';

import 'package:flutter/material.dart';

class ReviewTile extends StatefulWidget {
  final String OptionText;
  final Icon icon;
  final Icon icon2;
  final int numberOf;
  ReviewTile({
    super.key,
    required this.OptionText,
    required this.icon,
    required this.icon2,
    required this.numberOf,
  });
  @override
  _ReviewTileState createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: widget.icon,
                alignment: Alignment.center,
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide(width: 2, color: Colors.black)))),
            SizedBox(
              width: 15,
            ),
            widget.icon2,
            SizedBox(
              width: 15,
            ),
            Text(
              "${widget.OptionText}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
                child: Text(widget.numberOf.toString()),
                alignment: Alignment.center,
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(width: 1, color: Colors.black)))),
          ],
        ),
      ),
    );
  }
}
