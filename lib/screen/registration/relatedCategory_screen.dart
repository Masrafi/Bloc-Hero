import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_bloc.dart';
import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_state.dart';
import 'package:bdtender_bloc/model/registration_model/relatedCategory_model.dart';
import 'package:bdtender_bloc/repository/registration_repo/relatedCategory_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;

import '../../utils/heder.dart';

class ReletedCategory extends StatefulWidget {
  // final String tGHCode;
  // final String _namer;
  // final String _degicnation;
  // final String _organization;
  // //final String _address;
  // final String _phoneNum;
  // final String _emailFirst;
  // final String _password;
  // final String group;
  // ReletedCategory(
  //   this.tGHCode,
  //   this._namer,
  //   this._degicnation,
  //   this._organization,
  //   //this._address,
  //   this._phoneNum,
  //   this._emailFirst,
  //   this._password,
  //   this.group,
  // );
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
    return BlocProvider(
      create: (_) => RelatedCategoryBloc(RepositoryRelatedCategory()),
      child: Scaffold(
        appBar: header(context, titleText: ""),
        body: BlocBuilder<RelatedCategoryBloc, RelatedCategoryState>(
          builder: (context, state) {
            if (state is RelatedCategoryLoadedState) {
              List<RelatedCategoryModel> dataList = state.users;
              if (dataList.isNotEmpty) {
                for (int i = 0; i < dataList.length; i++) {
                  check.add(false);
                }
                return Column(
                  children: [
                    Flexible(
                        child: ListView.builder(
                            itemCount: dataList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) {
                              return CheckboxListTile(
                                title: Text(
                                  "${dataList[index].groupHead}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                value: check[index],
                                onChanged: (value) {
                                  setState(() {
                                    check[index] = value!;
                                    if (value == true) {
                                      _list.add(dataList[index].ghCode);
                                    } else {
                                      _list.remove(dataList[index].ghCode);
                                      print(_list);
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              );
                            })),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          if (_list.isNotEmpty) {
                            print(_list);
                            int score = await Future.delayed(
                                const Duration(milliseconds: 200), () => 42);

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
                          height: 15,
                          width: 20,
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
            }
            if (state is RelatedCategoryLoadingState) {
              return Center(
                child: Text(
                  "Loading...",
                ),
              );
            }
            if (state is RelatedCategoryErrorState) {
              return Center(child: Text("Error"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
