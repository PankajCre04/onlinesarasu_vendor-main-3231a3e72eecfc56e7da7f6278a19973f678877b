import 'package:flutter/material.dart';
import 'package:sooooperbusiness/commons/constant.dart';

class SingleSelectionChip extends StatefulWidget {
  final List<dynamic> reportList;
  final Function(dynamic) onSelectionChanged;
  var selectedChoice;

  SingleSelectionChip(this.reportList,this.selectedChoice, {required this.onSelectionChanged});

  @override
  _SingleSelectionChip createState() => _SingleSelectionChip();
}

class _SingleSelectionChip extends State<SingleSelectionChip> {


  _buildChoiceList() {
    List<Widget> choices = List.empty(growable: true);
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          backgroundColor: widget.selectedChoice == item.id
              ? Constant.secondaryColor
              : Constant.borderColor,
          label: Text(
            item.name,
            style: TextStyle(
                color: widget.selectedChoice == item.id
                    ? Constant.white
                    : Constant.black),
          ),
          selected: widget.selectedChoice == item.id,
          selectedColor: Constant.secondaryColor,
          onSelected: (selected) {
            setState(() {
              widget.selectedChoice = item.id;
              widget.onSelectionChanged(widget.selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
