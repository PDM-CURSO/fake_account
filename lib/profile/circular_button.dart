import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData iconData;
  final Color bgColor;
  final String? textAction;
  final Function? action;
  CircularButton({
    super.key,
    required this.bgColor,
    this.textAction,
    this.action,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CircleAvatar(
            child: Icon(
              iconData,
              color: Colors.grey[200],
            ),
            backgroundColor: bgColor,
            radius: 38,
          ),
          onTap: action as void Function()?,
        ),
        SizedBox(height: 24),
        Text("${textAction ?? "No action"}"),
      ],
    );
  }
}
