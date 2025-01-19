import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:intl/intl.dart';
import 'package:orderapp/main.dart';
import 'package:page_transition/page_transition.dart';

class Helper {
  static String? paymentMode = "Google Pay";
  static String? firmType = "Intel Banglore SRR4A";
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

  static String setDateFormat({String? format, DateTime? dateTime}) {
    return DateFormat(format ?? "yyyy-MM-dd")
        .format(dateTime ?? DateTime.now());
  }

  static setPaymentMode(value) {
    paymentMode = value;
  }
    static setFirmType(value) {
    firmType = value;
  }

    static Future<void> hapticSuccess() async =>
      await Haptics.vibrate(HapticsType.success);
  static Future<void> hapticWarning() async =>
      await Haptics.vibrate(HapticsType.warning);
  static Future<void> hapticerror() async =>
      await Haptics.vibrate(HapticsType.error);
  static Future<void> hapticlight() async =>
      await Haptics.vibrate(HapticsType.light);
  static Future<void> hapticmedium() async =>
      await Haptics.vibrate(HapticsType.medium);
  static Future<void> hapticheavy() async =>
      await Haptics.vibrate(HapticsType.heavy);
  static Future<void> hapticrigid() async =>
      await Haptics.vibrate(HapticsType.rigid);
  static Future<void> hapticsoft() async =>
      await Haptics.vibrate(HapticsType.soft);
  static Future<void> hapticselection() async =>
      await Haptics.vibrate(HapticsType.selection);
}
