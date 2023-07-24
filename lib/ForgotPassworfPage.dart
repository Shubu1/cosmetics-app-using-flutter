import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/appstates/appstate.dart';
import 'package:flutter_login/firebaseProvider/base_firebase_service.dart';
import 'package:flutter_login/firebaseProvider/dialog.dart';
import 'package:flutter_login/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  SimpleFontelicoProgressDialog? _dialog;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailExists = true;
  var email;
  @override
  void initState() {
    _dialog = SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    super.initState();
  }

  void showdialog() async {
    _dialog!.show(
        message: 'Loading...', type: SimpleFontelicoProgressDialogType.spinner);
  }

  Future<void> sendPasswordResetLink() async {
    final email = _emailController.text;

    // Validate fields
    if (_formKey.currentState!.validate()) {
      try {
        // Check if user exists
        final userExists = await _checkUserExists(email);

        if (userExists) {
          _dialog!.show(
              message: 'Loading...',
              type: SimpleFontelicoProgressDialogType.spinner);
          // Send password reset link
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
          _dialog!.hide();
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            "Link Sent",
            "Password reset link sent to $email",
            colorText: Colors.red,
            backgroundColor: Colors.black,
            borderRadius: 10,
            borderColor: Colors.white,
            borderWidth: 4,
            margin: EdgeInsets.all(10),
            animationDuration: Duration(milliseconds: 3000),
            backgroundGradient:
                LinearGradient(colors: [Colors.grey, Colors.grey]),
            boxShadows: [
              BoxShadow(
                  color: Colors.yellow,
                  offset: Offset(30, 50),
                  spreadRadius: 20,
                  blurRadius: 8),
            ],
            isDismissible: true,
            // duration: Duration(milliseconds: 8000),
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            shouldIconPulse: false,
            leftBarIndicatorColor: Colors.white,
            mainButton: TextButton(
              child: Text('ok'),
              onPressed: () {
                Get.back();
              },
            ),
            showProgressIndicator: true,
            progressIndicatorBackgroundColor: Colors.deepOrange,
          );
        } else {
          setState(() {
            _emailExists = false;
          });
        }
      } catch (e) {
        // _dialog!.hide();
        // Handle error
        print('Error sending password reset link: $e');
        // _dialog!.hide();
      }
    }
  }

  Future<bool> _checkUserExists(String email) async {
    try {
      //  showdialog();
      // Use Firebase authentication to check if the user exists
      final user =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return user.isNotEmpty;
    } catch (e) {
      // Handle error
      print('Error checking user existence: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    BlockerDialog dialog = BlockerDialog(context);
    return Consumer(builder: (context, ref, child) {
      ref.listen<AppState>(authProvider, (previous, next) {
        next.maybeMap<void>(
          loading: (value) {
            if (!value.loading!) {
              dialog.dismissdialog();
            } else {
              dialog.showdialog();
            }
          },
          success: (value) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Link Sent'),
                content: Text('Password reset link sent to $email.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          error: (value) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text(
                      " 'We could not send a link to the email address you provided. Try using a registered email address.',"),
                  actions: [
                    TextButton(
                      child: const Text("ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      //child: const Text("yes"),
                    ),
                  ],
                );
              },
            );
          },
          orElse: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Could not processed your request!!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Dismiss"))
                  ],
                );
              },
            );
          },
        );
      });
      return Scaffold(
        /* appBar: AppBar(
        title: Text('Forgot Password'),
      ),*/
        backgroundColor: Color.fromARGB(251, 140, 102, 231),
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  /*decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),*/
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    labelText: 'Email',

                    filled: true,
                    fillColor: Colors.white,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    // errorText: emailError,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email()
                  ]),
                ),
                if (!_emailExists)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    // WidgetsBinding.instance!.addPostFrameCallback((_) { });
                    child: Text(
                      'We could not send a link to the email address you provided. Try using a registered email address.',
                      //Get.snackbar("Error Title", "We couldnot send a link to email address you provided .Try using registered email address.",);
                      style: TextStyle(color: Colors.red),
                    ), //
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: sendPasswordResetLink,
                  child: Text('Send Reset Link'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login'),
      ),*/
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
            );
          },
          child: Text(
            'Forgot Password',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}
