// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/core/model/user_model.dart';
import 'package:todo_1/screens/auth/login.dart';
import 'package:todo_1/screens/home/home_page.dart';
import 'package:todo_1/widgets/dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  static const String routeName = 'SignUp';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userName = '';
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
              child:  Text(
                '${AppLocalizations.of(context)!.hello}\n${AppLocalizations.of(context)!.signUp}',
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
                          userName = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          labelText: AppLocalizations.of(context)!.userName,
                          labelStyle: const TextStyle(color: Color(0xff5D9CEC)),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          labelText: AppLocalizations.of(context)!.email,
                          labelStyle: const TextStyle(color: Color(0xff5D9CEC)),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration:  InputDecoration(
                          labelText: AppLocalizations.of(context)!.password,
                          labelStyle: const TextStyle(color: Color(0xff5D9CEC)),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          logOut(context);
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
                          child:  Center(
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
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
                        flex: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.alreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, LogIn.routeName);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.logIn,
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

  void logOut(BuildContext context) async {
    try {
      showLoading(context);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel.currentUser = UserModel(
        id: credential.user!.uid,
        userName: userName,
        email: email,
      );
      registerUserInFireStore(UserModel.currentUser!);
      if (context.mounted) {
        hideLoading(context);
        Navigator.pushNamed(context, HomePage.routeName);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An error occurred.';
      }
      if (context.mounted) {
        hideLoading(context);
        showMessage(context,
            title: 'error', body: errorMessage, posbtnTitle: 'ok');
      }
    } catch (e) {
      if (context.mounted) {
        hideLoading(context);
        showMessage(context,
            title: 'error', body: 'An error occurred.', posbtnTitle: 'ok');
      }
    }
  }

  void registerUserInFireStore(UserModel user) async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection(UserModel.collectionName);
    DocumentReference userDocument = userCollection.doc(user.id);
    await userDocument.set(user.toJson());
  }
}
