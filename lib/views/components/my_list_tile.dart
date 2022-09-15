import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:sooooperbusiness/commons/constant.dart';

class MyListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String? subtitle;
  final IconData trailingIconData;
  final EdgeInsets margin;
  final String? leadingImageName;
  final Color? trailingColor;

  const MyListTile({
    required this.title,
    required this.onPressed,
    required this.subtitle,
    required this.leadingImageName,
    required this.trailingIconData,
    required this.trailingColor,
    this.margin = const EdgeInsets.only(bottom: 10),
  });

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      allowOverflow: true,
      color: Constant.white,
      padding: 0,
      elevation: 0,
      borderWidth: 2,
      showBorder: true,
      borderColor: Constant.borderColor,
      borderRadius: 10,
      child: ListTile(
        leading: this.leadingImageName == null
            ? null
            : Image.asset(
                "assets/images/$leadingImageName",
                // width: 75,
                // height: double.infinity,
                fit: BoxFit.cover,
              ),
        onTap: onPressed,
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle.toString()),
        trailing: CircleAvatar(
          backgroundColor: trailingIconData == null
              ? Colors.transparent
              : this.trailingColor?.withOpacity(0.15) ??
                  Theme.of(context).accentColor.withOpacity(0.15),
          child: Icon(
            trailingIconData,
            color: this.trailingColor ?? Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
