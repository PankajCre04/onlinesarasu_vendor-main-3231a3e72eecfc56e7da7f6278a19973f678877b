import 'package:flutter/material.dart';

class dineInTable {
  String? tableNumber;
  String? tableStatus;
  int? status;

  dineInTable(this.tableNumber, this.tableStatus, this.status);

  Map toJson() => {
        'tableNumber': tableNumber,
        'tableStatus': tableStatus,
        'status': status
      };
}

List<dineInTable> tableData = [
  dineInTable("1", "Vacant", 0),
  dineInTable("2", "Vacant", 0),
  dineInTable("3", "Being Used", 1),
  dineInTable("4", "Vacant", 0),
  dineInTable("5", "Being Used", 1),
  dineInTable("6", "Vacant", 0),
  dineInTable("7", "Vacant", 0),
  dineInTable("8", "Being Used", 1),
  dineInTable("9", "Vacant", 0),
  dineInTable("10", "Being Used", 1),
  dineInTable("11", "Vacant", 0),
  dineInTable("12", "Vacant", 0),
  dineInTable("13", "Reserved", 3),
  dineInTable("14", "Reserved", 3),
  dineInTable("15", "Vacant", 0),
  dineInTable("16", "Vacant", 0),
  dineInTable("17", "Vacant", 0),
  dineInTable("18", "Vacant", 0),
];
