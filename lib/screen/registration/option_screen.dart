import 'package:bdtender_bloc/bloc/registration/signup_bloc/signup_event.dart';
import 'package:bdtender_bloc/bloc/registration/signup_bloc/signup_state.dart';
import 'package:bdtender_bloc/repository/registration_repo/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../bloc/registration/signup_bloc/signup_bloc.dart';
import '../../utils/heder.dart';

class Option extends StatefulWidget {
  final List tGHCode;
  final String name;
  final String designation;
  final String organization;
  //final String _address;
  final String phoneNum;
  final String emailFirst;
  final String password;
  final String group;
  Option({
    required this.tGHCode,
    required this.name,
    required this.designation,
    required this.organization,
    //this._address,
    required this.phoneNum,
    required this.emailFirst,
    required this.password,
    required this.group,
  });

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool checkedValue = false;
  List list = [];
  List<bool> check = [];

  void checkbox(bool val, int index) {
    setState(() {
      check[index] = val;
    });
  }

  // Future sentData() async {
  //   var url = "https://bdtender.com/api/register";
  //   var response = await http.post(Uri.parse(url), body: {
  //     "ContactPerson": widget.namer,
  //     "Designation": widget.degicnation,
  //     "Organization": widget.organization,
  //     "Phone": widget.phoneNum,
  //     "Email": widget.emailFirst,
  //     "Password": widget.password,
  //     "Subscription_plan": widget.group,
  //     "Subscriber_Category": list.toString()
  //   });
  //   var data = jsonDecode(response.body);
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    List data = widget.tGHCode;
    print("thei is data: $data");
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        check.add(false);
      }
    }
    return BlocProvider(
      create: (context) => SignUpBloc(RepositorySignUp()),
      child: Scaffold(
        appBar: header(context, titleText: "BDTender"),
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child:
              BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
            if (state is SignUpInitialState) {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return CheckboxListTile(
                            title: Text(
                              "${data[index].catname}",
                              style: TextStyle(fontSize: 16),
                            ),
                            value: check[index],
                            onChanged: (value) {
                              setState(() {
                                check[index] = value!;
                                if (value == true) {
                                  list.add(data[index].catcode);
                                  print(list);
                                } else {
                                  list.remove(data[index].catcode);
                                  print(list);
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        if (list.isNotEmpty) {
                          BlocProvider.of<SignUpBloc>(context).add(
                            SignUpTextSubmitEvent(
                              name: widget.name,
                              designation: widget.designation,
                              organization: widget.organization,
                              phone: widget.phoneNum,
                              email: widget.emailFirst,
                              password: widget.password,
                              group: widget.group,
                              category: list,
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink,
                        ),
                        child: Center(
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            }
            if (state is SignUpErrorState) {
              return Text(state.errorMessage.toString());
            }
            if (state is SignUpLoadingState) {
              return CircularProgressIndicator();
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
