import 'package:flutter/material.dart';
import 'package:login_projects/services/navigatorkey.dart';
import 'package:login_projects/widgets/dialog_widget/pop_dialog.dart';

class DialogServices {
  static  dialogLoading(){

    if(NavigationServices.key!=null){
      showDialog(context: NavigationServices.key.currentContext!, builder: (context) => const LoadingDialogWidget());
    }
  }
  static dialogPop(){
    if(NavigationServices.key.currentContext!=null){
      Navigator.pop(NavigationServices.key.currentContext!);
    }
  }
}