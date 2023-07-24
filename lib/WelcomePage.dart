import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/firebaseProvider/dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class WelcomePage extends ConsumerWidget {
  final String userData;
  const WelcomePage({Key? key, required this.userData}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BlockerDialog dialog = BlockerDialog(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.green,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/1.jpg',
                    ),
                  ),
                  title: Text(
                    "Welcome to your profile page, $userData!",
                    style: AppTheme.bigText.copyWith(color: Colors.black),
                  )),
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  dialog.dismissdialog();
                  Get.back();
                },
              ),
              ElevatedButton(
                child: Text("Buttom sheet"),
                onPressed: () {
                  dialog.dismissdialog();
                  Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: Text('Light Theme'),
                            onTap: () => {Get.changeTheme(ThemeData.light())},
                          ),
                          ListTile(
                            leading: const Icon(Icons.wb_sunny),
                            title: Text('Dark Theme'),
                            onTap: () => {Get.changeTheme(ThemeData.dark())},
                          ),
                        ],
                      ),
                    ),
                    barrierColor: Colors.greenAccent.shade100,
                    backgroundColor: Colors.purple,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2.0),
                    ),
                    enableDrag: true,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
