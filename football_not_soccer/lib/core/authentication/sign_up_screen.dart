import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';
import 'package:football_not_soccer/core/authentication/sign_in_screen.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_event.dart';
import 'package:football_not_soccer/core/root/root_screen.dart';
import 'package:football_not_soccer/widgets/auth_provider_buttons.dart';
import 'package:football_not_soccer/widgets/card.dart';
import 'package:football_not_soccer/widgets/rounded_button.dart';
import 'package:football_not_soccer/widgets/textfield_container.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User? firebaseUser;
  String? email;
  String? password;
  TextEditingController _passController = TextEditingController();
  bool _passObscureText = true;
  bool _confirmPassObscureText = true;

  void _togglePassVisibility() {
    setState(() {
      _passObscureText = !_passObscureText;
    });
  }

  void _toggleConfirmPassVisibility() {
    setState(() {
      _confirmPassObscureText = !_confirmPassObscureText;
    });
  }

  Widget _buildEmail() {
    return TextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          border: InputBorder.none,
          icon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'Email is reuired';
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
        onSaved: (String? value) {
          email = value!.trim();
        },
      ),
    );
  }

  Widget _buildPassword() {
    return TextFieldContainer(
      child: TextFormField(
        controller: _passController,
        decoration: InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          icon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _togglePassVisibility();
              });
            },
            child: _passObscureText == true
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
        ),
        obscureText: _passObscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is reuired';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return TextFieldContainer(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        border: InputBorder.none,
        icon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _toggleConfirmPassVisibility();
            });
          },
          child: _confirmPassObscureText == true
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
      obscureText: _confirmPassObscureText,
      validator: (value) {
        if (value!.isEmpty) return 'Confirm your password';
        if (_passController.text != value) return 'Passwords do not match';
        return null;
      },
      onSaved: (String? value) {
        password = value;
      },
    ));
  }

  Widget _buildCreateAccountBtn(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Center(
        child: RoundButton(
      textOnButton: 'Create Account',
      onPressed: () async {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          _formKey.currentState!.save();
          User? user = await authBloc.authRepository
              .signUpWithCredentials(email!, password!);
          if (user != null) authBloc.add(LoggedIn(user));
        }
      },
    ));
  }

  Widget _buildSignUpUsingText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 8),
          Text('-OR-', style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('Sign up using',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: width > 600 ? 600 : width,
          child: CustomCard(
            child: Form(
              key: _formKey,
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(height: 22),
                  _buildEmail(),
                  _buildPassword(),
                  _buildConfirmPassword(),
                  Container(height: 22),
                  _buildCreateAccountBtn(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?'),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignInScreen())),
                          child: Text('Sign In'))
                    ],
                  ),
                  _buildSignUpUsingText(),
                  Container(height: 12),
                  AuthProviderButtons()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
