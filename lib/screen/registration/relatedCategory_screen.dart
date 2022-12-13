import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_bloc.dart';
import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_state.dart';
import 'package:bdtender_bloc/model/registration_model/relatedCategory_model.dart';
import 'package:bdtender_bloc/repository/registration_repo/option_repo.dart';
import 'package:bdtender_bloc/repository/registration_repo/relatedCategory_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/registration/option_bloc/option_bloc.dart';
import '../../bloc/registration/option_bloc/option_event.dart';
import '../../bloc/registration/option_bloc/option_state.dart';
import '../../model/registration_model/option_model.dart';
import '../../utils/heder.dart';

class ReletedCategory extends StatefulWidget {
  final List tGHCode;
  final String name;
  final String designation;
  final String organization;
  //final String _address;
  final String phoneNum;
  final String emailFirst;
  final String password;
  final String group;
  ReletedCategory({
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
  _ReletedCategoryState createState() => _ReletedCategoryState();
}

class _ReletedCategoryState extends State<ReletedCategory> {
  bool checkedValue = false;
  late bool pressed;
  List _list = [];
  List<bool> check = <bool>[];

  void checkbox(bool val, int index) {
    setState(() {
      check[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    List data = widget.tGHCode;
    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        check.add(false);
      }
    }
    return BlocProvider(
      create: (context) => OptionBloc(RepositoryOption()),
      child: Scaffold(
        appBar: header(context, titleText: ""),
        body: BlocListener<OptionBloc, OptionState>(
          listener: (context, state) {
            if (state is OptionLoadedState) {
              List<OptionModel> dataList = state.users;
              Navigator.pushNamed(
                context,
                '/option',
                arguments: {
                  "tGHCode": dataList,
                  "namer": widget.name,
                  "degicnation": widget.designation,
                  "organization": widget.organization,
                  "phoneNum": widget.phoneNum,
                  "emailFirst": widget.emailFirst,
                  "password": widget.password,
                  "group": widget.group,
                },
              );
            }
            if (state is OptionErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Loaded Failed'),
                ),
              );
            }
          },
          child:
              BlocBuilder<OptionBloc, OptionState>(builder: (context, state) {
            if (state is OptionLoadingState) {
              return CircularProgressIndicator();
            }
            if (state is OptionErrorState) {
              return Center(child: Text("Error"));
            }
            return Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return CheckboxListTile(
                        title: Text(
                          "${data[index].groupHead}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        value: check[index],
                        onChanged: (value) {
                          setState(() {
                            check[index] = value!;
                            if (value == true) {
                              _list.add(
                                data[index].ghCode,
                              );
                              print(_list);
                            } else {
                              _list.remove(
                                data[index].ghCode,
                              );
                              print(_list);
                            }
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (_list.isNotEmpty) {
                        BlocProvider.of<OptionBloc>(context)
                            .add(OptionSubmittedEvent(ghCode: _list));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CategoryOption(
                        //           _list.toString(),
                        //           widget._namer.toString(),
                        //           widget._degicnation.toString(),
                        //           widget._organization.toString(),
                        //           widget._phoneNum.toString(),
                        //           widget._emailFirst.toString(),
                        //           widget._password.toString(),
                        //           widget.group.toString(),
                        //         )));

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
          }),
        ),
      ),
    );
  }
}
