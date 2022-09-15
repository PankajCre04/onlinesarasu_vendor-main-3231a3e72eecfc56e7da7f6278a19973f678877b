import 'package:flutter/material.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/order/vendor_orders/vendor_model/vendor_model.dart';

class VendorOrderDetails extends StatefulWidget {
  final Product product;
  VendorOrderDetails({required this.product});

  @override
  State<VendorOrderDetails> createState() => _VendorOrderDetailsState();
}

class _VendorOrderDetailsState extends State<VendorOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.withOpacity(0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${widget.product.name}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Product Description",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
