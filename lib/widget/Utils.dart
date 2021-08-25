import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

showConnectivitySnackBar(context) {
  // final hasInternet = result == ConnectivityResult.none;
  final message = 'Internet Connectivity Update';
  final color = Colors.red;
  Utils.showTopSnackBar(context, message, color);
}

class Utils {
  static void showTopSnackBar(BuildContext context, message, color) =>
      showSimpleNotification(Text(message), background: color);
}
