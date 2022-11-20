import 'package:bdtender_bloc/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/liveCount_bloc/liveCount_bloc.dart';
import '../bloc/liveCount_bloc/liveCount_state.dart';
import '../model/todayCount_model.dart';

class Live extends StatelessWidget {
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveCountBloc, LiveCountState>(
        builder: (context, state) {
      if (state is LiveCountLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is LiveCountErrorState) {
        return Center(
          child: Text("Error"),
        );
      }
      if (state is LiveCountLoadedState) {
        List<TodayCountModel> userList = state.users;
        return SizedBox(
          height: 40,
          width: 120,
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
                            "Live Tender",
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
                    Navigator.pushNamed(context, '/liveDetails');
                  },
                );
              }),
        );
      }
      return Container();
    });
  }
}
