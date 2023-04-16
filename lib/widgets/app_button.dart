import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_text_dart.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  String? text;
  IconData? icon;
  double size;
  bool? isIcon;
  final Color borderColor;

  AppButton({
    Key? key,
    this.text = "1",
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
