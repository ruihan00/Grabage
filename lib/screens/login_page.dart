import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grabage/constant.dart';
import 'package:flutter/material.dart';
import 'package:grabage/screens/register_page.dart';
import 'package:grabage/services/validators.dart';

class LoginPage extends StatefulWidget with EmailAndPasswordValidator {
  LoginPage({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _passwordVisible;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;

  bool logoutUser = false;

  void _submit() async {
    if (_errorCheck()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print("signed in");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Text(
                            "This email is not registered. Please create a new account.")
                      ],
                    ),
                  ),
                );
              });
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Text(
                            "Incorrect password for this user. Please try again.")
                      ],
                    ),
                  ),
                );
              });
          print('Wrong password provided for that user.');
        }
      }
    }
    setState(() {
      _submitted = true;
    });
  }

  bool _errorCheck() {
    return _submitted &&
        widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _passwordEditingComplete() {
    final newFocus = widget.passwordValidator.isValid(_password)
        ? _repeatPasswordFocusNode
        : _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(gradient: loginBackground),
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(left: 40, right: 40),
              //Widgets are here
              child: SingleChildScrollView(
                child: SizedBox(
                  width: max(MediaQuery.of(context).size.width * 0.2, 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 0.0,
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: const Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      _buildTextFieldHeader("Email"),
                      Material(
                        elevation: 8,
                        shadowColor: Colors.black,
                        // color: Colors.transparent,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)),
                        child: TextField(
                          focusNode: _emailFocusNode,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.start,
                          decoration: signupTextFieldDecoration.copyWith(
                            errorText: _submitted &&
                                !widget.emailValidator.isValid(_email)
                                ? widget.invalidEmailErrorText
                                : null,
                            errorStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 0.01,
                            ),
                            enabled: _isLoading == false,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Visibility(
                                    visible: (_submitted &&
                                        !widget.emailValidator.isValid(_email)),
                                    child: const Icon(
                                      Icons.priority_high,
                                      color: red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (email) => _updateState(),
                          onEditingComplete: _emailEditingComplete,
                        ),
                      ),
                      Visibility(
                        visible: (_submitted &&
                            !widget.emailValidator.isValid(_email)),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Invalid Email",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontStyle: FontStyle.normal,
                                color: red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      _buildTextFieldHeader("Password"),
                      Material(
                        elevation: 8,
                        shadowColor: Colors.black,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)),
                        child: TextField(
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          obscureText: !_passwordVisible!,
                          textAlign: TextAlign.start,
                          onChanged: (password) => _updateState(),
                          decoration: signupTextFieldDecoration.copyWith(
                            errorText: _submitted &&
                                !widget.passwordValidator.isValid(_password)
                                ? widget.invalidPasswordErrorText
                                : null,
                            errorStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 0.01,
                            ),
                            enabled: _isLoading == false,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Visibility(
                                    visible: (_submitted &&
                                        !widget.passwordValidator
                                            .isValid(_password)),
                                    child: const Icon(
                                      Icons.priority_high,
                                      color: red,
                                    ),
                                  ),
                                  IconButton(
                                    icon: _passwordVisible!
                                        ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                        : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (_submitted &&
                            !widget.passwordValidator.isValid(_password)),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Invalid Password",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontStyle: FontStyle.normal,
                                color: red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      //Done button
                      Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          const SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              elevation: 8,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () {
                                  if (!_isLoading) {
                                    _submit();
                                  } else {
                                    return;
                                  }
                                },
                                minWidth: 157.0,
                                height: 40.0,
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: green,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              elevation: 8,
                              shadowColor: Colors.black,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                minWidth: 157.0,
                                height: 40.0,
                                child: const Text(
                                  "Create New Account",
                                  style: TextStyle(
                                    color: green,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }

  Widget _buildTextFieldHeader(String headerText) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      child: Text(
        headerText,
        style: const TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }
}
