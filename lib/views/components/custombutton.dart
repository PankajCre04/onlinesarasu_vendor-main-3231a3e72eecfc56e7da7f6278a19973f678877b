import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/views/components/customcontainer.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? borderRadius;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final EdgeInsets? customPadding;
  final TextStyle? textStyle;

  const CustomButton(
      {required this.title,
      required this.onTap,
      this.textColor,
      this.backgroundColor,
      this.width,
      this.height,
      this.margin,
      this.padding = 10,
      this.borderRadius,
      this.customPadding,
      this.textStyle});

  factory CustomButton.basic({
    required String title,
    required VoidCallback onTap,
    double? width,
    bool selected = false,
    bool infiniteWidth = true,
    double? borderRadius,
  }) {
    return CustomButton(
      title: title,
      height: 40,
      margin: const EdgeInsets.all(1),
      width: infiniteWidth ? double.infinity : width,
      backgroundColor: selected ? Constant.secondaryColor : Colors.blueGrey.withOpacity(0.2),
      textColor: selected ? Colors.white : Colors.black,
      onTap: onTap,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height ?? 50,
      paddingEdge: customPadding ?? EdgeInsets.all(padding),
      width: width,
      borderRadius: this.borderRadius ?? 10,
      margin: margin ?? const EdgeInsets.all(5),
      onTap: onTap,
      child: FittedBox(
        child: Text(
          title,
          style: textStyle ??
              TextStyle(color: textColor ?? Colors.white, fontSize: 16),
        ),
      ),
      backgroundColor: backgroundColor ?? Theme.of(context).accentColor,
    );
  }
}
