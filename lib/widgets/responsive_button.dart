import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_text_dart.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width=120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFf07d3f),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 5,
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: isResponsive==true? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
            children: [
              isResponsive ==true ?AppText(text: "Book Now", color: Colors.white,):Container(),
              Image.asset("assets/images/arrow-right.png")
              ]
            ),
        ),
      ),
    );
  }
}
