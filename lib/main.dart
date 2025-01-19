import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orderapp/orderpage.dart';
import 'package:orderapp/orderpreparepage.dart';
import 'package:orderapp/utils/constants.dart';
import 'package:orderapp/utils/prefmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const SystemUiOverlayStyle(statusBarBrightness: Brightness.light);
  var data = await PrefManager.getData();
  Map? orderData = {};
  if (data != "") {
    orderData = jsonDecode(data);
  }
  runApp(MyApp(data: orderData));
}

class MyApp extends StatelessWidget {
  final Map? data;
  const MyApp({super.key, required this.data});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        dividerColor: Colors.black,
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor, // Button background color
            elevation: 4, // Shadow elevation
            shadowColor: Colors.black.withOpacity(0.2), // Shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 24,
            ), // Padding
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(
        //     backgroundColor: primaryColor, // Button background color
        //     // side: const BorderSide(color: Colors.black), // Border
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8.0), // Rounded corners
        //     ),
        //     padding: const EdgeInsets.symmetric(
        //         vertical: 12, horizontal: 24), // Padding
        //   ),
        // ),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarBrightness: Brightness.light),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700),
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0.5,
            backgroundColor: primaryColor),
        scaffoldBackgroundColor: scaffoldColor,
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: data!.isNotEmpty
          ? OrderViewPage(data: data)
          : const OrderPreparePage(),
      //const OrderViewPage(),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
