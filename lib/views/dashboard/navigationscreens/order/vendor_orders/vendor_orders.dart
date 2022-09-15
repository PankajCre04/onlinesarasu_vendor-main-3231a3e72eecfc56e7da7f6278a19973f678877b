import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/vendor_orders/vendor_model/vendor_model.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/vendor_orders/vendor_model/vendor_order_details.dart';

class VendorOrders extends StatefulWidget {
  const VendorOrders({Key? key}) : super(key: key);

  @override
  State<VendorOrders> createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders> {
  @override
  void initState() {
    super.initState();
    // fetch data form api
    gettingVendorOrders();
  }

  late List<Datum> orders;
  void gettingVendorOrders() async {
    String? token = await SessionManager.getAccessToken();
    String url = "https://onlinesarasu.ssdemo.xyz/api/ecom/orders";
    await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    ).then((response) {
      if (response.statusCode == 200) {
        print("right");
        var ress = VendorOrdModel.fromJson(jsonDecode(response.body));
        orders = ress.data;
      } else {
        throw Exception('Failed auth-->');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, dataIndex) {
              return Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders[dataIndex].items.length,
                    itemBuilder: (context, itemIndex) {
                      return Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: orders[dataIndex].items[itemIndex].products.length,
                            itemBuilder: (context, productIndex) {
                              return Text("hello");
                            }),
                      );
                    }),
              );
            },
          ))
        ],
      ),
    );
  }
}
