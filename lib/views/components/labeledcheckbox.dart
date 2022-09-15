import 'package:flutter/material.dart';
import 'package:sooooperbusiness/commons/constant.dart';

class LabelCheckBox extends StatefulWidget {
  final String? labelText;
  final void Function(bool?)? onChanged;
  final bool? defaultValue;
  Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final bool? helperTextEnabled;
  final String? helperText;

  LabelCheckBox(
      {@required this.labelText,
      @required this.onChanged,
      @required this.defaultValue,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.helperText,
      this.helperTextEnabled = false});

  @override
  _LabelCheckBoxState createState() => _LabelCheckBoxState();
}

class _LabelCheckBoxState extends State<LabelCheckBox> {
  @override
  Widget build(BuildContext context) {
    this.widget.borderColor ??= Theme.of(context).accentColor;
    return Container(
      decoration: BoxDecoration(
          color: Constant.white,
          borderRadius: BorderRadius.circular(
              widget.borderRadius != null ? widget.borderRadius! : 10),
          border: Border.all(
            color: widget.borderColor!,
            width: widget.borderWidth != null ? widget.borderWidth! : 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: widget.defaultValue,
            onChanged: widget.onChanged,
            activeColor: Constant.secondaryColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.labelText!,
                style: TextStyle(color: Constant.black, fontSize: 16),
              ),
              widget.helperTextEnabled!
                  ? Text(
                      widget.helperText!,
                      style: TextStyle(color: Constant.greyDark, fontSize: 12),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
