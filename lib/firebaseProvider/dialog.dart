import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

GlobalKey<NavigatorState> appNavigator = GlobalKey();

//BlockerDialog dialog = BlockerDialog(appNavigator.currentContext!);
//To use this class make instance of this class and call show or hide method accordingly
class BlockerDialog {
  late SimpleFontelicoProgressDialog _dialog;

  BlockerDialog(BuildContext context) {
    _dialog = SimpleFontelicoProgressDialog(context: context);
  }

  void showdialog() {
    debugPrint("Show Dialog");
    _dialog.show(
        message: "",
        type: SimpleFontelicoProgressDialogType.normal,
        hideText: true,
        backgroundColor: Colors.transparent);
  }

  void dismissdialog() {
    debugPrint("Hide Dialog");
    _dialog.hide();
  }
}
