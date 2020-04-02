import 'package:flutter/material.dart';
import 'package:event_holding_app/Home/home_ui.dart';

void main() => runApp(EventHoldingApp());

class EventHoldingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        hoverColor: Colors.transparent
      ),
    );
  }
}