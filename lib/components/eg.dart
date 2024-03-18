import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/components/neu_box.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          NeuBox(
            child: Icon(
              Icons.search,
              size: 50,
            ),
          )
        ],
      ),
    ));
  }
}
