import 'package:bdtender_bloc/bloc/login_bloc/login_event.dart';
import 'package:bdtender_bloc/bloc/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../utils/color.dart';
import '../utils/heder.dart';
import '../bloc/internet_bloc/internet_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = new TextEditingController();
  var passController = new TextEditingController();
  bool colo1 = false;
  bool colo2 = false;
  late String fName, lName, email, pass, conPass;
  bool _obscureText = true;
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, titleText: 'BDTender'),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              BlocConsumer<InternetCubit, InternetState>(
                listener: (context, state) {
                  if (state == InternetState.Gained) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Internet connected'),
                      ),
                    );
                  } else if (state == InternetState.Lost) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Internet not connected'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Container();
                },
              ),
              BlocListener<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInSuccessState) {
                    //showSpinner = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Successfully'),
                      ),
                    );
                  }
                  if (state is LogInFailState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Fail'),
                      ),
                    );
                  }
                },
                child: BlocBuilder<LogInBloc, LogInState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 40,
                            right: MediaQuery.of(context).size.height / 40,
                            top: MediaQuery.of(context).size.height / 40,
                            bottom: MediaQuery.of(context).size.height / 40,
                          ),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 5,
                            left: MediaQuery.of(context).size.height / 40,
                            right: MediaQuery.of(context).size.height / 40,
                            // top: displayWidth(context) * .04,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/registration.png',
                                    height: 50,
                                    width: 20,
                                  ),
                                  Text(
                                    'Log In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  if (state is LogInErrorState) ...[
                                    Center(
                                      child: Text(
                                        state.errorMessage,
                                        style: TextStyle(
                                          color: color.blackB,
                                        ),
                                      ),
                                    )
                                  ],
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                onTap: () {
                                  setState(() {
                                    colo1 = true;
                                    colo2 = false;
                                  });
                                },
                                onChanged: (value) {
                                  email = value;
                                  BlocProvider.of<LogInBloc>(context).add(
                                      LogInTextChangeEvent(emailController.text,
                                          passController.text));
                                },
                                controller: emailController,
                                cursorColor: Colors.green,
                                keyboardType: TextInputType.emailAddress,
                                //controller: _email,
                                style: TextStyle(color: Colors.green),
                                validator: (val) =>
                                    val!.isEmpty || !val.contains("@")
                                        ? "Enter a valid eamil"
                                        : null,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    ),
                                    //border: InputBorder.none,
                                    // contentPadding: EdgeInsets.only(top: 14, left: 20, right: 20),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: colo1 == true
                                            ? Colors.green
                                            : Colors.black,
                                        size: 20,
                                      ), // Change this icon as per your requirement
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: colo1 == true
                                          ? Colors.green
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                onTap: () {
                                  setState(() {
                                    colo1 = false;
                                    colo2 = true;
                                  });
                                },
                                onChanged: (va) {
                                  BlocProvider.of<LogInBloc>(context).add(
                                      LogInTextChangeEvent(emailController.text,
                                          passController.text));
                                },
                                keyboardType: TextInputType.visiblePassword,
                                //controller: _pass,
                                controller: passController,
                                style: TextStyle(color: Colors.green),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Password is empty';
                                  } else if (val.trim().length < 8) {
                                    return "Give at least 6 characters";
                                  }
                                },
                                cursorColor: Colors.green,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                    ),
                                    //border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      top: 14,
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        FontAwesomeIcons.key,
                                        color: colo2 == true
                                            ? Colors.green
                                            : Colors.black,
                                        size: 20,
                                      ), // Change this icon as per your requirement
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        //_toggle();
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.eye,
                                        color: colo2 == true
                                            ? Colors.green
                                            : Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: colo2 == true
                                          ? Colors.green
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ForgotPas()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        if (state is LogInLoadingState) ...[
                          Center(child: CircularProgressIndicator())
                        ],
                        Container(
                          margin:
                              EdgeInsets.only(left: 270, right: 20, top: 50),
                          height: 45,
                          decoration: BoxDecoration(
                            color: (state is LogInValidState)
                                ? color.theme
                                : Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              if (state is LogInValidState) {
                                BlocProvider.of<LogInBloc>(context).add(
                                  LogInSubmittedEvent(
                                    emailController.text,
                                    passController.text,
                                  ),
                                );
                                emailController.clear();
                                passController.clear();
                                // Navigator.pushNamed(context, '/internet', arguments: {
                                //   "title": emailController.text,
                                //   "pass": passController.text
                                // });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('TextField is not valid'),
                                  ),
                                );
                              }
                            },
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize:
                                    MediaQuery.of(context).size.height / 55,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => Gamin()));
                                });
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
