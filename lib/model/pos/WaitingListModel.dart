import 'package:flutter/material.dart';
import '../../views/dashboard/navigationscreens/order/orderProcessing/processing_order.dart';

class WaitingList{
  String? Name;
  String? id;
  String? time;
  String? peaple;

  WaitingList(this.Name,this.id,this.time,this.peaple);
  
}

List<WaitingList> waitingList = [
  WaitingList("Sachin Ghaware", "9767301020", "2:25 PM", "10 peaple"),
  WaitingList("Rohan Patil", "9767301892", "2:40 PM", "5 peaple"),
  WaitingList("Ajay Mane", "9862145787", "2:40 PM", "2 peaple"),
  WaitingList("Rohit Patil", "9687451281", "2:50 PM", "15 peaple"),
];