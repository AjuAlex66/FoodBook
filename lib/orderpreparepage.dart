import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:orderapp/orderpage.dart';
import 'package:orderapp/utils/helper.dart';
import 'package:orderapp/utils/prefmanager.dart';

class OrderPreparePage extends StatefulWidget {
  const OrderPreparePage({super.key});

  @override
  State<OrderPreparePage> createState() => _OrderPreparePageState();
}

class _OrderPreparePageState extends State<OrderPreparePage> {
  TextEditingController orderId = TextEditingController();
  TextEditingController counterController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController itemsController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController subTotalController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController toatalTwoController = TextEditingController();
  TextEditingController paymentModelController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime time = DateTime.now();

  @override
  void initState() {
    dateController.text = Helper.setDateFormat(dateTime: time);
    Helper.orderDate = time;
    timeController.text =
        Helper.setDateFormat(dateTime: time, format: "hh:mm a");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prepare Order"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              commonFields(
                  title: "Order ID",
                  hintText: "Enter order id",
                  controller: orderId),
              commonFields(
                  title: "Counter",
                  hintText: "Enter counter",
                  controller: counterController,
                  type: TextInputType.number),
              const Divider(),
              commonFields(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 10))
                        .then((value) {
                      if (value != null) {
                        Helper.orderDate = value;
                        dateController.text =
                            Helper.setDateFormat(dateTime: value);
                      }
                    });
                  },
                  readOnly: true,
                  title: "Order Date",
                  hintText: "Order date",
                  controller: dateController),
              commonFields(
                  readOnly: true,
                  title: "Order Time",
                  hintText: "Order time",
                  onTap: () {
                    DateTime now = DateTime.now();
                    showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay(hour: now.hour, minute: now.minute))
                        .then((value) {
                      if (value != null) {
                        Helper.orderDate = DateTime(
                            Helper.orderDate!.year,
                            Helper.orderDate!.month,
                            Helper.orderDate!.day,
                            value.hour,
                            value.minute);

                        timeController.text = Helper.setDateFormat(
                            dateTime: Helper.orderDate, format: "hh:mm a");
                      }
                    });
                  },
                  controller: timeController),
              const Divider(),
              commonFields(
                  title: "Items",
                  maxLines: 4,
                  hintText: "Enter order time",
                  controller: itemsController),
              commonFields(
                  title: "Total",
                  type: const TextInputType.numberWithOptions(decimal: true),
                  hintText: "Enter total",
                  controller: totalController),
              const Divider(),
              commonFields(
                  title: "Subtotal",
                  type: const TextInputType.numberWithOptions(decimal: true),
                  hintText: "Enter order time",
                  controller: subTotalController),
              commonFields(
                  title: "Total Tax",
                  type: const TextInputType.numberWithOptions(decimal: true),
                  hintText: "Enter tax",
                  controller: taxController),
              const Divider(),
              commonFields(
                  title: "Total ",
                  textInputAction: TextInputAction.done,
                  hintText: "Enter total",
                  type: const TextInputType.numberWithOptions(decimal: true),
                  controller: toatalTwoController),
              const Divider(),
              commonFields(
                  title: "Payment Mode",
                  hintText: "Enter order time",
                  controller: paymentModelController,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText:
                          'Select an option', // Replace with your hintText
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    isExpanded: true,
                    value: Helper.paymentMode,
                    items: ["Google Pay", "Paytm", "PhonePe", "Amazon Pay"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => Helper.setPaymentMode(value),
                  )),
              InkWell(
                onTap: () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      Map data = {
                        "orderId": orderId.text,
                        "counter": counterController.text,
                        "orderDate": dateController.text,
                        "orderTime": timeController.text,
                        "items": itemsController.text,
                        "total": totalController.text,
                        "subTotal": subTotalController.text,
                        "totalTax": taxController.text,
                        "paymentMode": Helper.paymentMode
                      };
                      await PrefManager.saveData(data);
                      Helper.pushReplacement(OrderViewPage(data: data), "");
                    }
                  } on Exception catch (e) {
                    log(e.toString());
                    Helper.showSnack("Something went wrong");
                  }
                },
                child: Container(
                  width: Helper.width(),
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  child: const Text(
                    "Complete Order",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  commonFields(
          {String? title,
          hintText,
          TextInputAction? textInputAction,
          TextEditingController? controller,
          TextInputType? type,
          bool? readOnly = false,
          Widget? child,
          Function()? onTap,
          int? maxLines}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title!,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Helper.allowHeight(10),
          child ??
              TextFormField(
                textInputAction: textInputAction ?? TextInputAction.next,
                onTap: readOnly! ? onTap : () {},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: maxLines ?? 1,
                readOnly: readOnly,
                keyboardType: type ?? TextInputType.text,
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  // hintText: hintText!,
                  border: OutlineInputBorder(),
                ),
              ),
          Helper.allowHeight(15),
        ],
      );
}
