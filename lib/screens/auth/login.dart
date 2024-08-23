// ignore_for_file: unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/core/model/user_model.dart';
import 'package:todo_1/screens/auth/signup.dart';
import 'package:todo_1/screens/home/home_page.dart';
import 'package:todo_1/widgets/dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogIn extends StatefulWidget {
  static const String routeName = 'LogIn';
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [Color(0xff5D9CEC), Color(0xffDFECDB)])),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.08,
              ),
              child: Text(
                '${AppLocalizations.of(context)!.hello}\n${AppLocalizations.of(context)!.signIn}',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.10,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.email,
                          labelStyle: const TextStyle(color: Color(0xff5D9CEC)),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password,
                          labelStyle: const TextStyle(color: Color(0xff5D9CEC)),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          logIn(context);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff5D9CEC), Color(0xffDFECDB)],
                              begin: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.signIn,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.dontHaveAnAccount,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SignUp.routeName);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.signUp,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void logIn(BuildContext context) async {
    try {
      showLoading(context);
      print("Attempting to log in with email: $email and password: $password");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel.currentUser = await getUserFromFireStore(credential.user!.uid);
      print("Login successful: $credential");
      if (context.mounted) {
        hideLoading(context);
        Navigator.pushNamed(context, HomePage.routeName);
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code}");
      if (e.code == 'invalid-credential') {
        print('Check your email and password and try again');
      } else {
        print('An error occurred: ${e.message}');
      }
      if (context.mounted) {
        hideLoading(context);
        showMessage(
          context,
          title: 'Error',
          body: 'An error occurred: ${e.message}',
          posbtnTitle: 'Ok',
        );
      }
    } catch (e) {
      print("Unexpected error: $e");
      if (context.mounted) {
        hideLoading(context);
        showMessage(
          context,
          title: 'Error',
          body: 'An error occurred: ${e.toString()}',
          posbtnTitle: 'Ok',
        );
      }
    }
  }

  Future<UserModel> getUserFromFireStore(String id) async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection(UserModel.collectionName);
    DocumentReference userDocument = userCollection.doc(id);
    DocumentSnapshot userSnapshot = await userDocument.get();
    return UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
  }
}
