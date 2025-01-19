import 'package:flutter/material.dart';
import 'package:orderapp/orderpreparepage.dart';
import 'package:orderapp/utils/constants.dart';
import 'package:orderapp/utils/helper.dart';
import 'package:orderapp/utils/prefmanager.dart';
import 'package:orderapp/widgets/customcontainer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderViewPage extends StatefulWidget {
  final Map? data;
  const OrderViewPage({super.key, required this.data});

  @override
  State<OrderViewPage> createState() => _OrderViewPageState();
}

class _OrderViewPageState extends State<OrderViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Order Details",
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14.0),
          children: [
            Image.asset(
              'assets/images/foodbowl.png',
              width: 60,
              height: 60,
            ),
            Helper.allowHeight(20),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data!['firm'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.60),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Helper.allowHeight(5),
                  // DottedBorder(
                  //   borderType: BorderType.RRect,
                  //   child:
                  const Divider(),
                  Helper.allowHeight(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Order ID",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.40),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Counter",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.40),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Helper.allowHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.data!['orderId'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.60),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.data!['counter'],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.60),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Helper.allowHeight(15),
            CustomContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order ID ${widget.data!['orderId']}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.80),
                        fontWeight: FontWeight.w600),
                  ),
                  Helper.allowHeight(5),
                  Text(
                    "From ${widget.data!['counter']}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.80),
                        fontWeight: FontWeight.w600),
                  ),
                  Helper.allowHeight(10),
                  QrImageView(
                    data: widget.data!.toString(),
                    size: 250,
                  ),
                  Helper.allowHeight(10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await PrefManager.clearAll();
                        Helper.hapticlight();
                        Helper.pushReplacement(const OrderPreparePage(), "");
                      },
                      child: Text(
                        "Order Served?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: white, // Text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Helper.allowHeight(15),
                  Text(
                    "Your food is for immediate\nconsumption after it is served to you",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.60),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Helper.allowHeight(15),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Order Details",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.70),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Helper.allowHeight(20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Order Date",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.40),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Order Time",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.40),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Helper.allowHeight(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.data!['orderDate'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.data!['orderTime'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Helper.allowHeight(15),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Items",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.40),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.40),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Helper.allowHeight(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.data!['items'],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "₹ ${widget.data!['subTotal']}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Helper.allowHeight(10),
                  const Divider(),
                  Helper.allowHeight(10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹ ${widget.data!['subTotal']}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Helper.allowHeight(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Tax",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.70),
                                    fontWeight: FontWeight.w500),
                              ),
                              Helper.allowWidth(4.0),
                              const Icon(
                                Icons.info_outline,
                                size: 16,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          Text(
                            "₹ ${widget.data!['totalTax']}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Helper.allowHeight(10),
                      const Divider(),
                      Helper.allowHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "₹ ${widget.data!['total']}",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black.withOpacity(0.70),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Helper.allowHeight(15),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Payment Mode",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.70),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Helper.allowHeight(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "UPI Apps",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.70),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${widget.data!['paymentMode']}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.50),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Helper.allowHeight(15),
            Text(
              "Reference Number : 241905752860",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.40),
                  fontWeight: FontWeight.w600),
            ),
            Helper.allowHeight(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Please show this screen to collect order",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.40),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Helper.allowHeight(15),
          ],
        ),
      ),
    );
  }
}
