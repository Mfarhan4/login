import 'package:flutter/material.dart';

class LoadingDialogWidget  extends StatelessWidget {
  const LoadingDialogWidget ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
