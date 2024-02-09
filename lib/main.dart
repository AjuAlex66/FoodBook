import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orderapp/orderpage.dart';
import 'package:orderapp/orderpreparepage.dart';
import 'package:orderapp/utils/prefmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.orange,
                statusBarBrightness: Brightness.light),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            backgroundColor: Colors.orange),
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
