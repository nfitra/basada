import 'package:basada/app/utils/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.elevation = 0,
    this.color = primary,
    this.textColor = Colors.black,
    this.borderRadius = 29,
  }) : super(key: key);
  final String text;
  final void Function()? press;
  final Color color;
  final Color? textColor;
  final double? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: width ?? size.width * 0.8,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius!),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(color: color),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
