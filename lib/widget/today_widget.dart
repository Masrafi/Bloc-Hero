import 'package:bdtender_bloc/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todayCount_bloc/todayCount_bloc.dart';
import '../bloc/todayCount_bloc/todayCount_state.dart';
import '../model/todayCount_model.dart';

class Today extends StatelessWidget {
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayCountBloc, TodayCountState>(
        builder: (context, state) {
      if (state is TodayCountLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TodayCountErrorState) {
        return Center(
          child: Text("Error"),
        );
      }
      if (state is TodayCountLoadedState) {
        List<TodayCountModel> userList = state.users;
        return SizedBox(
          height: 40,
          width: 100,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 20,
                        color: color.theme,
                      ),
                      Column(
                        children: [
                          Text(
                            "Today’s",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userList[index].message,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/todayDetails');
                  },
                );
              }),
        );
      }
      return Container();
    });
  }
}
