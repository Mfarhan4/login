import 'package:flutter/material.dart';

import '../palette/palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.onClick,required this.text}) : super(key: key);
  final  Function onClick;
 final  String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      onClick();
    }, child:  Text(text,style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(primary: Palette.color,minimumSize: const Size(40, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),);
  }
}
