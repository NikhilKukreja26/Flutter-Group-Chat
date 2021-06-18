import 'package:flutter/material.dart';

class BuildCircularLoading extends StatelessWidget {
  const BuildCircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 20.0,
      child: CircularProgressIndicator(),
    );
  }
}
