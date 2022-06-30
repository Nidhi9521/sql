import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pls Select Flag To Find'),
      actions: [

      ],
    );
  }
}
