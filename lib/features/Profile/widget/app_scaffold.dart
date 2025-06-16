import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppScaffold extends StatelessWidget {
  Widget? body;
  AppBar? appbar;
  AppScaffold({super.key, this.body, this.appbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: body,
      ),
    );
  }
}
