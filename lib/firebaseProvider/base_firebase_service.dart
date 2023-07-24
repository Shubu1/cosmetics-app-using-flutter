import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as Location;
//import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

import '../appstates/appstate.dart';

class AuthStateNotifier extends StateNotifier<AppState> {
  AuthStateNotifier(this._reader) : super(const AppState.initial());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailExists = true;
  Location.LocationData? locationData;
  List<Placemark>? placeMark;

  final Ref _reader;
  Future<void> sendPasswordResetLink() async {
    final email = _emailController.text;

    // Validate fields
    if (_formKey.currentState!.validate()) {
      try {
        // Check if user exists
        final userExists = await _checkUserExists(email);

        if (userExists) {
          state = const AppState.loading(loading: true);
          // Send password reset link
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
          state = const AppState.loading(loading: false);
          state = AppState.success(data: userExists);
        } else {
          _emailExists = false;
        }
      } catch (e) {
        // _dialog!.hide();
        // Handle error
        debugPrint('Error sending password reset link: $e');
        state = const AppState.loading(loading: false);
        state = const AppState.error(data: []);
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

  Future<void> signinUserWithFirebase(String userData, String passData) async {
    try {
      // dialog.showdialog();
      state = const AppState.loading(loading: true);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userData,
        password: passData,
      );
      //dialog.dismissdialog();
      state = const AppState.loading(loading: false);
      //dialog.dismissdialog();
      FocusManager.instance.primaryFocus?.unfocus();
      state = AppState.success(data: userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('User not found');
        // state = const AppState.loading(loading: false);
      } else if (e.code == 'wrong-password') {
        debugPrint('The password you entered is incorrect.Please try again');
        // state = const AppState.loading(loading: false);
      }
      state = const AppState.loading(loading: false);
      state = AppState.error(data: []);
    } catch (e) {
      debugPrint('Error occurred: $e');
      state = AppState.error(data: []);
    }
  }

  Future<void> signupUserWithFirebase(String userData, String passData) async {
    bool? isSuccess = false;
    try {
      // dialog.showdialog();
      state = const AppState.loading(loading: true);

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData,
        password: passData,
      );
      state = const AppState.loading(loading: false);
      state = AppState.success(data: userCredential);

      //dialog.dismissdialog();
      final data = {
        'email': userData,
        'password': passData,
      };

      isSuccess = await addUserToDatabase(data, 'users');
      FocusManager.instance.primaryFocus?.unfocus();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('Email already in use');
        // state = const AppState.loading(loading: false);
      }
      state = const AppState.loading(loading: false);
      state = AppState.error(data: []);
    } catch (e) {
      debugPrint('Error occurred: $e');
      state = const AppState.loading(loading: false);
      state = AppState.error(data: []);
    }
  }

  Future<void> addDataToFirebase(
      Map<String, dynamic> data, String collectionName) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
      debugPrint('Data added successfully to Firestore');
    } catch (e) {
      debugPrint('Error adding data to Firestore: $e');
    }
  }

  Future<bool?> addUserToDatabase(
      Map<String, dynamic> data, String collectionName) async {
    try {
      await addDataToFirebase(data, collectionName);
      return true; // Data added successfully
    } catch (e) {
      return false; // Error occurred while adding data
    }
  }

  Future<void> getPermission() async {
    //   state = AppState.loading(loading: true);
    if (await Permission.location.isGranted) {
      //   state = AppState.loading(loading: false);
      getLocation();
      //get location
    } else {
      //  state = AppState.loading(loading: false);
      Permission.location.request();
    }
  }

  Future<void> getLocation() async {
    //state = AppState.loading(loading: true);
    locationData = await Location.Location.instance.getLocation();
    // state = AppState.loading(loading: false);
  }

  Future<void> getAddress() async {
    //  state = AppState.loading(loading: true);
    if (locationData != null) {
      //   state = AppState.loading(loading: true);
      final latitude = locationData?.latitude;
      final longitude = locationData?.longitude;
      if (latitude != null && longitude != null) {
        placeMark = await placemarkFromCoordinates(latitude, longitude);
      } else {
        const Text("Latitude longitude not found");
      }
    }
  }
}

final authProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AppState>((ref) {
  return AuthStateNotifier(ref);
});
final helperDataProvider =
    StateNotifierProvider<HelperData, String>((ref) => HelperData());

class HelperData extends StateNotifier<String> {
  HelperData() : super('');
  String? email = " ";
  void updateEmail(String value) {
    state = value;
  }
}
