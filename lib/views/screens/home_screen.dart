import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:jhijri/_src/_jHijri.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 10.edgeInsetsAll,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 0, child: Text(DateFormat("dd/MM/yyyy").format(DateTime.now()), style: TextStyle(fontSize: 30))),
                  Spacer(),
                  Expanded(flex: 0, child: Text("${JHijri.now().day}/${JHijri.now().month}/${JHijri.now().year}", style: TextStyle(fontSize: 30))),
                ],
              ),
              Text("الاحد", style: TextStyle(fontSize: 60)),
            ],
          ),
        ),
      ),
    );
  }
}
