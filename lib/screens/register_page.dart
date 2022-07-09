import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grabage/constant.dart';
import 'package:grabage/services/validators.dart';


EmailAndPasswordValidator test = EmailAndPasswordValidator();

class RegisterPage extends StatefulWidget
    with EmailAndPasswordValidator {
  RegisterPage({Key? key}) : super(key: key);
  static const String id = 'register_screen';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with EmailAndPasswordValidator {
  bool? _passwordVisible;
  bool? _repeatPasswordVisible;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
  TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();

  String get _name => _nameController.text;

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  String get _repeatPassword => _repeatPasswordController.text;
  bool _submitted = false;
  bool _isLoading = false;

  bool logoutUser = false;

  void _submit() async {
    if (_errorCheck()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password
        );
        print("acc created");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
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
                            "This email is already linked to an existing account, please register using another email!")
                      ],
                    ),
                  ),
                );
              });
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      _submitted = true;
      // _isLoading = true;
    });
  }

  bool _errorCheck() {
    return _submitted &&
        widget.nameValidator.isValid(_name) &&
        widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        isValidRepeatPassword();
  }

  void _nameEditingComplete() {
    final newFocus =
    widget.nameValidator.isValid(_name) ? _emailFocusNode : _nameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
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

  bool isValidRepeatPassword() {
    return _password == _repeatPassword;
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
    _repeatPasswordVisible = false;
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
                        height: 14.0,
                      ),
                      _buildTextFieldHeader("Name"),
                      Material(
                        elevation: 8,
                        shadowColor: Colors.black,
                        // color: Colors.transparent,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)),
                        child: TextField(
                          focusNode: _nameFocusNode,
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          decoration: signupTextFieldDecoration.copyWith(
                            errorText: _submitted &&
                                !widget.nameValidator.isValid(_name)
                                ? widget.invalidNameErrorText
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
                                        !widget.nameValidator.isValid(_name)),
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
                          onChanged: (name) => _updateState(),
                          onEditingComplete: _nameEditingComplete,
                        ),
                      ),
                      Visibility(
                        visible: (_submitted &&
                            !widget.nameValidator.isValid(_name)),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Invalid Name",
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
                      _buildTextFieldHeader("Email"),

                      /// DELETE FROM HERE ONCE DYNAMIC LINKS WORK
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

                      /// DELETE UNTIL HERE ONCE DYNAMIC LINKS WORK
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
                          onEditingComplete: _passwordEditingComplete,
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
                        height: 14.0,
                      ),
                      _buildTextFieldHeader("Repeat Password"),
                      Material(
                        elevation: 8,
                        shadowColor: Colors.black,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)),
                        child: TextField(
                          focusNode: _repeatPasswordFocusNode,
                          controller: _repeatPasswordController,
                          obscureText: !_repeatPasswordVisible!,
                          textAlign: TextAlign.start,
                          onChanged: (password) => _updateState(),
                          decoration: signupTextFieldDecoration.copyWith(
                            errorText: _submitted && !isValidRepeatPassword()
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
                                        !isValidRepeatPassword()),
                                    child: const Icon(
                                      Icons.priority_high,
                                      color: red,
                                    ),
                                  ),
                                  IconButton(
                                    icon: _repeatPasswordVisible!
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
                                        _repeatPasswordVisible =
                                        !_repeatPasswordVisible!;
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
                        visible: (_submitted && !isValidRepeatPassword()),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            "Passwords Not Matching",
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
                                  "Done",
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
                            height: 10.0,
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
                                  Navigator.pop(context);
                                },
                                minWidth: 157.0,
                                height: 40.0,
                                child: const Text(
                                  "Cancel",
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
