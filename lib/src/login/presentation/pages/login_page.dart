import 'package:farm_app/core/presentation/pages/loading.dart';
import 'package:farm_app/src/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../register/presentation/pages/register_page.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(),
      passwordController = TextEditingController();
  final bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffB3FFFC),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(4, 8),
                  blurRadius: 4,
                )
              ]),
              // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                // color: Color(0xff2c666e),
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Welcome to FARMPAL!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff2c666e)),
                          ),
                        ),
                        Text('Please Log In to Continue'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text('Email'),
                                ),
                                TextField(
                                  controller: emailController,
                                  cursorColor: Color(0xff2c666e),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff2c666e),
                                              width: 2)),
                                      hintText: 'Enter Your Email',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero)),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Password',
                                    // style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextField(
                                  controller: passwordController,
                                  cursorColor: Color(0xff2c666e),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff2c666e),
                                              width: 2)),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Enter Your Password',
                                      border: OutlineInputBorder(
                                          // borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.zero)),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff2c666e),
                                  minimumSize: Size.fromHeight(50)),
                              onPressed: () async {
                                return showDialog(
                                    context: context,
                                    builder: (context) => LoadingPage(
                                          errorText: bloc.signIn(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text),
                                          onLoadingDone: () =>
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage())),
                                        ));
                              },
                              child: Text('Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Don\'t have an account? '),
                                InkWell(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Color(0xff2c666e),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
