import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:orderapp/main.dart';
import 'package:page_transition/page_transition.dart';

class Helper {
  static String? paymentMode = "Google Pay";
  static GlobalKey key = NavigationService.navigatorKey;

  static DateTime? orderDate = DateTime.now();
  static getContext() => key.currentContext;
  static showToast(String msg) {
    Fluttertoast.cancel(); // for immediate stopping
    return Fluttertoast.showToast(msg: msg);
  }

  static pop({value}) {
    return Navigator.pop(Helper.getContext(), value ?? false);
  }

  static width() {
    return MediaQuery.of(Helper.getContext()).size.width;
  }

  static allowHeight(double height) {
    return SizedBox(height: height);
  }

  static allowWidth(double width) {
    return SizedBox(width: width);
  }

  static popAndPush(dynamic route, String name) {
    Helper.pop();
    return Navigator.push(
      Helper.getContext(),
      PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.fade,
        isIos: true,
        child: route,
      ),
      // MaterialPageRoute(
      //     settings: RouteSettings(arguments: name),
      //     builder: ((context) => route)),
    );
    // return Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       settings: RouteSettings(arguments: name),
    //       builder: ((context) => route)),
    // );
  }

  static push(dynamic route, String name) {
    return Navigator.push(
      Helper.getContext(),
      PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.fade,
        isIos: true,
        child: route,
      ),
    );
  }

  static pushWithThen(dynamic route, String name, Function? then) {
    return Navigator.push(
      Helper.getContext(),
      PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.fade,
        isIos: true,
        child: route,
      ),
    ).then((value) => then);
  }

  static pushReplacementRemove(dynamic namedRoute, String? name) {
    Navigator.of(Helper.getContext()).pushAndRemoveUntil(
        PageTransition(
          type: PageTransitionType.fade,
          isIos: true,
          child: namedRoute,
        ),
        (Route<dynamic> route) => false);
  }

  static pushReplacement(dynamic route, String? name) {
    return Navigator.pushReplacement(
        Helper.getContext(),
        PageTransition(
          type: PageTransitionType.fade,
          isIos: true,
          child: route,
        )
        // MaterialPageRoute(
        //     settings: RouteSettings(arguments: name),
        //     builder: ((context) => route)),
        );
  }

  static showSnack(String? text) {
    ScaffoldMessenger.of(getContext()).hideCurrentSnackBar();
    ScaffoldMessenger.of(getContext()).showSnackBar(
        SnackBar(duration: const Duration(seconds: 5), content: Text(text!)));
  }

  static setDateFormat({String? format, DateTime? dateTime}) {
    return DateFormat(format ?? "yyyy-MM-dd")
        .format(dateTime ?? DateTime.now());
  }

  static setPaymentMode(value) {
    paymentMode = value;
  }
}
