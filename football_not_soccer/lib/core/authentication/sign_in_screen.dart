import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_event.dart';
import 'package:football_not_soccer/core/authentication/sign_up_screen.dart';
import 'package:football_not_soccer/core/root/root_screen.dart';
import 'package:football_not_soccer/widgets/auth_provider_buttons.dart';
import 'package:football_not_soccer/widgets/card.dart';
import 'package:football_not_soccer/widgets/rounded_button.dart';
import 'package:football_not_soccer/widgets/textfield_container.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  User? firebaseUser;
  String? email;
  String? password;
  TextEditingController _passController = TextEditingController();
  bool _passObscureText = true;

  void _togglePassVisibility() {
    setState(() {
      _passObscureText = !_passObscureText;
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
          if (value == null || value.trim().isEmpty) {
            return 'Email is required';
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
          if (value == null || value.trim().isEmpty) {
            return 'Password is required';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
        onSaved: (String? value) {
          password = value!.trim();
        },
      ),
    );
  }

  Widget _buildSignInBtn(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Center(
        child: RoundButton(
      textOnButton: 'Sign In',
      onPressed: () async {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          _formKey.currentState!.save();
          final User? user = await authBloc.authRepository
              .signInWithCredentials(email!, password!);
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
          SizedBox(height: 16),
          Text('-OR-', style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('Sign In using',
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
                      'Hey there, Welcome to FNS!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(height: 22),
                  _buildEmail(),
                  _buildPassword(),
                  Container(height: 22),
                  _buildSignInBtn(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not Registered ?'),
                      TextButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUp())),
                          child: Text('Register'))
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
