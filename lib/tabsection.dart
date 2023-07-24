import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/appstates/appstate.dart';
import 'package:flutter_login/firebaseProvider/base_firebase_service.dart';
import 'package:flutter_login/firebaseProvider/dialog.dart';
import 'package:flutter_login/newpage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'ForgotPassworfPage.dart';

class TabSection extends ConsumerStatefulWidget {
  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends ConsumerState<TabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    // _dialog = SimpleFontelicoProgressDialog(context: context);
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(38.0),
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              LoginTab(
                tabController: _tabController,
              ),
              SignupTab(
                tabController: _tabController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginTab extends ConsumerStatefulWidget {
  final TabController tabController;

  const LoginTab({super.key, required this.tabController});

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends ConsumerState<LoginTab> {
  // TextEditingController usernameController = TextEditingController();
  //SimpleFontelicoProgressDialog? _dialog;
  bool isResetLinkSent = false;

  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> formData = {};
  // ignore: prefer_typing_uninitialized_variables
  var userData;
  // ignore: prefer_typing_uninitialized_variables
  var passData;
  bool _obscureText = true;
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
            _formKey.currentState!.reset();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Data Obtained")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                //  builder: (context) => WelcomePage(userData: userData),
                builder: (context) => NewPage(userData: userData),
                fullscreenDialog: true,
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
                      "This account does not exist. Please try again or create a new account."),
                  actions: [
                    TextButton(
                      child: const Text("yes"),
                      onPressed: () {
                        Navigator.pop(context);
                        widget.tabController.animateTo(1);
                      },
                      //child: const Text("yes"),
                    ),
                    TextButton(
                        child: const Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
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
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: FocusScope(
          child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilderTextField(
                      //  initialValue: widget.registeredEmail.toString(),
                      name: 'email',
                      initialValue: ref.watch(helperDataProvider).toString(),
                      // controller: widget.usernameController,
                      decoration: const InputDecoration(
                        hintText: "Email Address",
                        // hintStyle: TextStyle(color: Colors.red),
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
                        FormBuilderValidators.email(),
                      ]),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilderTextField(
                      name: 'password',
                      // controller: _controller,
                      obscureText: !_obscureText,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          // prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () => setState(() {
                              _obscureText = !_obscureText;
                            }),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          )),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                        FormBuilderValidators.match(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                            errorText:
                                "required number, capital letter and special character"),
                      ]),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              // Set the desired radius value
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            formData = _formKey.currentState!.value;
                            userData = formData['email'].toString();
                            passData = formData['password'].toString();
                            // Dismiss the keyboard
                            // _controller.clear();
                            ref
                                .read(authProvider.notifier)
                                .signinUserWithFirebase(userData, passData);
                            // showdata();
                          }
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        //ref.read(authProvider.notifier).sendPasswordResetLink();
                        //showData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()),
                        );
                      },
                      child: Container(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

class SignupTab extends ConsumerStatefulWidget {
  final TabController tabController;
  // final Function(String) onRegistrationSuccess;
  const SignupTab({super.key, required this.tabController});
  @override
  _SignupTabState createState() => _SignupTabState();
}

class _SignupTabState extends ConsumerState<SignupTab> {
  //SimpleFontelicoProgressDialog? _dialog;
  final _formKey = GlobalKey<FormBuilderState>();

  bool isResetLinkSent = false;

  late Map<String, dynamic> formData = {};
  // ignore: prefer_typing_uninitialized_variables
  var userData;
  // ignore: prefer_typing_uninitialized_variables
  var passData;
  //var cPassData;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    //final authNotifier = ref.watch(authProvider);
    BlockerDialog dialog = BlockerDialog(context);

    return Consumer(
      builder: (context, ref, child) {
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
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Registration Successful'),
                    content: const Text('You have successfully registered.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.tabController.animateTo(0);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            error: (value) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(' Registration Error'),
                    content: const Text(
                        'The User you are trying to register is already registered.Try new user to register'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: FocusScope(
            child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormBuilderTextField(
                        name: 'email',
                        // controller: _controller,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.email),
                          hintText: 'Email Address',
                          filled: true,
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          // errorText: emailError,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormBuilderTextField(
                        name: 'password',
                        // controller: _controller,
                        obscureText: !_obscureText,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            // prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () => setState(() {
                                _obscureText = !_obscureText;
                              }),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                          FormBuilderValidators.match(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                              errorText:
                                  "required number, capital letter and special character"),
                        ]),
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormBuilderTextField(
                        name: 'confirmpassword',
                        // controller: _controller,
                        obscureText: !_obscureText,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Confirm Password",
                            // prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () => setState(() {
                                _obscureText = !_obscureText;
                              }),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                          FormBuilderValidators.match(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                              errorText:
                                  "required number, capital letter and special character"),
                        ]),
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                // Set the desired radius value
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.saveAndValidate()) {
                              formData = _formKey.currentState!.value;
                              userData = formData['email'].toString();
                              passData = formData['password'].toString();
                              ref
                                  .read(authProvider.notifier)
                                  .signupUserWithFirebase(userData, passData);
                              ref
                                  .read(helperDataProvider.notifier)
                                  .updateEmail(userData);
                              //showData();
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
