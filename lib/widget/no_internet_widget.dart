import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

noInternetConnection(context, state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 48,
        ),
        SizedBox(
          height: 48,
        ),
        Text(
          'No Internet Connection',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'You are not connected to the internet.\n Make Sure Wi-fi is on, Airplane Mode is off\n and try again.',
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: () => state.refresh(), child: Text('Refresh'))
      ],
    ),
  );
}
