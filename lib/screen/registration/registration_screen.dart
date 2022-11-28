import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';
import '../../utils/heder.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _namer = new TextEditingController();
  var _degicnation = new TextEditingController();
  var _organization = new TextEditingController();
  var _phoneNum = new TextEditingController();
  late String _houseT;
  var _emailFirst = new TextEditingController();
  var _password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String group;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  int _groupValue = -1;
  var arr = [];
  var value;
  var number;
  logout() {
    // googleSignIn.signOut();
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Mas()));
  }

  final _scaffold = GlobalKey<ScaffoldState>();
  var masrafi;
  var showError;

  Future mailCheck() async {
    var url = "https://bdtender.com/api/email-duplicate-check";
    var response = await http.post(Uri.parse(url), body: {
      "email": _emailFirst.text,
    });
    print(_emailFirst.text);
    masrafi = jsonDecode(response.body);
    print(response.body);
    if (masrafi == "Success") {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("BDTender"),
                content: new Text("Already exists"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    } else if (masrafi == "Fail") {
      print("masrafi");
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => CategoryGroup(
      //             _namer.text,
      //             _degicnation.text,
      //             _organization.text,
      //             //_address.text,
      //             _phoneNum.text,
      //             _emailFirst.text,
      //             _password.text,
      //             group.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 15
              : 20;

      double logIn =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 26
              : 40;

      double headerSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 25;
      double height =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 60
              : 90;
      double width =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 30
              : 50;

      return Scaffold(
        appBar: header(context, titleText: 'BDTender'),
        body: Form(
          key: _formKey,
          child: ListView(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/registration.png',
                      height: height,
                      width: width,
                    ),
                    Text(
                      'Registration',
                      style: TextStyle(
                          fontSize: logIn,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _namer,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Name is empty';
                    } else {}
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your name... ',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    // icon: Icon(Icons.location_on),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  'designation',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _degicnation,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'designation is empty... ';
                    } else {}
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your designation...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Text(
                  'Organization',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  //textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.sentences,
                  controller: _organization,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Organization is empty';
                    } else {}
                  },
                  decoration: InputDecoration(
                    hintText: 'Organization name...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                //  Divider(thickness: 1.0,color: Colors.black),
                Text(
                  'Mobile Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNum,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Mobile number is empty';
                    } else if (val.trim().length < 11) {
                      return 'You have given less number';
                    } else if (val.trim().length > 11) {
                      return 'You have given more numbers';
                    } else {}
                  },
                  decoration: InputDecoration(
                    hintText: '01XXXXXXXXX',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailFirst,
                  validator: (val) => val!.isEmpty || !val.contains("@")
                      ? "Enter a valid eamil"
                      : null,
                  onSaved: (val) => _houseT = val!,
                  decoration: InputDecoration(
                    hintText: 'Type email address... ',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Password is empty';
                    } else if (val.trim().length < 8) {
                      return "Give at least 8 characters";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Give a secure password... ',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: titleSize,
                      fontFamily: 'OpenSans',
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      size: 20,
                    ),
                    Text(
                      "Duration:",
                      style: TextStyle(
                        fontSize: 20,
                        //fontStyle: FontStyle.italic
                      ),
                    )
                  ],
                ),
                ListTile(
                  title: const Text(
                    'Monthly 800',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (val) {
                      setState(() {
                        _groupValue = val as int;
                        group = val.toString();
                        print(group);
                      });
                    },
                  ),
                ),

                ListTile(
                  title: const Text(
                    'Quarterly 2000',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Radio(
                    value: 2,
                    groupValue: _groupValue,
                    onChanged: (val) {
                      setState(() {
                        _groupValue = val as int;
                        group = val.toString();
                        print(group);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Half-Yearly 3500',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Radio(
                    value: 6,
                    groupValue: _groupValue,
                    onChanged: (newValue) => setState(() {
                      _groupValue = newValue as int;
                      group = newValue.toString();
                    }),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Yearly 6000 taka only',
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Radio(
                    value: 12,
                    groupValue: _groupValue,
                    onChanged: (val) {
                      setState(() {
                        _groupValue = val as int;
                        group = val.toString();
                        print(group);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        group != null &&
                        _emailFirst.text != null) {
                      //mailCheck();
                      Navigator.pushNamed(
                        context,
                        '/categorygroup',
                        arguments: {
                          "namer": _namer.text,
                          "degicnation": _degicnation.text,
                          "organization": _organization.text,
                          "phoneNum": _phoneNum.text,
                          "emailFirst": _emailFirst.text,
                          "password": _password.text,
                          "group": group,
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: headerSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
        ),
      );
    });
  }
}
