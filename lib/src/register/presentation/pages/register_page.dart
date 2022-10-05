import 'package:farm_app/core/presentation/pages/loading.dart';
import 'package:farm_app/core/user/domain/entities/user.dart';
import 'package:farm_app/src/home/presentation/pages/homepage.dart';
import 'package:farm_app/src/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../injection_container.dart';
import '../../../login/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final bloc = sl<RegisterBloc>();

  final emailController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController();

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
              height: MediaQuery.of(context).size.height * 0.6,
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
                        Text('Continue to Register'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text('Full Name'),
                                ),
                                TextField(
                                  controller: nameController,
                                  cursorColor: Color(0xff2c666e),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff2c666e),
                                              width: 2)),
                                      hintText: 'Enter Your Full Name',
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
                                              width: 1)),
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
                                final user = User(
                                    id: Uuid().toString().substring(0, 10),
                                    name: nameController.text,
                                    email: emailController.text);
                                return showDialog(
                                    context: context,
                                    builder: (context) => LoadingPage(
                                          errorText: bloc.signUp(
                                              user: user,
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
                              child: Text('Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Already have an account? '),
                                InkWell(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Color(0xff2c666e),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
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
