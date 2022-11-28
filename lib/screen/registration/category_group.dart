import 'dart:convert';
import 'package:bdtender_bloc/bloc/registration/categoryGroup_bloc/categoryGroup_bloc.dart';
import 'package:bdtender_bloc/bloc/registration/categoryGroup_bloc/categoryGroup_state.dart';
import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_bloc.dart';
import 'package:bdtender_bloc/bloc/registration/relatedCategory_bloc/relatedCategory_event.dart';
import 'package:bdtender_bloc/repository/registration_repo/categoryGroup_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;

import '../../bloc/registration/categoryGroup_bloc/categoryGroup_event.dart';
import '../../model/registration_model/categoryGroup_model.dart';
import '../../repository/registration_repo/relatedCategory_repo.dart';
import '../../utils/heder.dart';

class CategoryGroup extends StatelessWidget {
  final String namer;
  final String degicnation;
  final String organization;
  final String phoneNum;
  final String emailFirst;
  final String password;
  final String group;
  const CategoryGroup({
    Key? key,
    required this.namer,
    required this.degicnation,
    required this.organization,
    //this._address,
    required this.phoneNum,
    required this.emailFirst,
    required this.password,
    required this.group,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryGroupBloc(
            RepositoryProvider.of<RepositoryCategoryGroup>(context),
          )..add(CategoryGroupLoadEvent()),
        ),
        BlocProvider(
          create: (_) => RelatedCategoryBloc(RepositoryRelatedCategory()),
        ),
      ],
      child: Scaffold(
        appBar: header(context, titleText: 'BDTender'),
        body: BlocBuilder<CategoryGroupBloc, CategoryGroupState>(
            builder: (context, state) {
          if (state is CategoryGroupLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryGroupErrorState) {
            return Center(
              child: Text("Error"),
            );
          }
          if (state is CategoryGroupLoadedState) {
            List<CategoryGroupModel> dataList = state.users;
            return ListView.builder(
              itemCount: dataList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                //List list = snapshot.data;
                return Container(
                  padding: EdgeInsets.only(top: 15),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      print(dataList[index].tghCode);

                      BlocProvider.of<RelatedCategoryBloc>(context).add(
                          RelatedCategorySubmittedEvent(
                              dataList[index].tghCode.toString()));
                      Navigator.pushNamed(
                        context,
                        '/relatedgroup',
                        // arguments: {
                        //   "namer": _namer.text,
                        //   "degicnation": _degicnation.text,
                        //   "organization": _organization.text,
                        //   "phoneNum": _phoneNum.text,
                        //   "emailFirst": _emailFirst.text,
                        //   "password": _password.text,
                        //   "group": group,
                        // },
                      );
                    },
                    child: Text(
                      "${dataList[index].topGroupHead}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}
